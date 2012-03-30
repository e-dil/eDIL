class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  
  def search
    @entry = Entry.find_by_orth(params[:q])
    redirect_to @entry
  end

  def show
    @entry = Entry.find(params[:id])
    begin
      @next_entry = Entry.find(params[:id].to_i + 1)
      @prev_entry = Entry.find(params[:id].to_i - 1)
    rescue
    end
  end
end
