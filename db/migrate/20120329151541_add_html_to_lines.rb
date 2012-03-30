class AddHtmlToLines < ActiveRecord::Migration
  def change
    add_column :lines, :html, :string

  end
end
