namespace :admin do
  desc "Import XML"
  task(:import => :environment) do
    [Line, Column].map(&:delete_all)
    Dir['xml/*.xml'].sort.each do |filename|
      puts "Opening: #{filename}."

      doc = File.read(filename)

      doc.scan(/<br\ column=\"(\d+)\"\ line=\"(\d+)\"\/>(.+)/) do |x, y, str|

        column = Column.find_or_create_by_number(x)
        
        # x - column
        # y - line
        # str - unprocessed, i.e. broken html fragments
        Line.create x: x, y: y, str: str, column: column

      end
    end
  end

  desc ''
  task(full: :environment) do
    [Entry, PartOfSpeech, Bibl].map(&:delete_all)

    Dir['xml/*.xml'].sort.each do |filename|
      doc = Nokogiri(File.read(filename))
      doc.css('entry').each do |entry|
        body = entry.inner_html.gsub(/<br.+?>/, '')
        orth = entry.css('orth').text
        e = Entry.create(body: body, orth: orth)

        puts e.id

        # Part Of Speech
        entry.css('pos').each do |pos|
          v = pos.content 
          v = pos['value'].to_s if v.empty?
          next if v.nil? or v.empty?
          e.part_of_speeches << PartOfSpeech.find_or_create_by_name(v)
        end

        # Bibliographic References
        entry.css('bibl').each do |bibl|
          e.bibls << Bibl.find_or_create_by_str(bibl.content)
        end

        # Definitions
        entry.css('def').each do |defi|
          e.definitions << Definition.create(name: defi.content)
        end
      end
    end
  end

  desc ''
  task(close: :environment) do

    # TagStack is the set of tags that have been opened, but not closed at any point
    tag_stack = []

    Line.all.each do |line|
      puts line.id

      # Add any opened tags that weren't closed on the previous line
      str = tag_stack.map{|t| "<#{t}>"}.join

      # Update the TagStack for the current line
      line.str.scan(/<.+?>/).each do |x| 
        # If this is a closing tag
        # FIXME: Assumes no self-closing tags
        if x[1] == '/' then
          tag_stack.pop 

        # This is a opening tag, so add the tag name to the stack 
        else
          tag_stack.push(x.match(/<(\w+)/)[1])
        end
      end

      # Wrap around the current line
      str += line.str 

      # Add closing tags that haven't been included
      str += tag_stack.reverse.map{|t| "</#{t}>"}.join

      # Sanitize Opening Tags
      str.gsub(/<(\w+)([^>]*)>/, '<span class="\1"\2>')

      # Sanitize Closing Tags
      str.gsub(/<\/.+?>/, '</span>')

      line.update_attribute :html, str
    end
  end
end
