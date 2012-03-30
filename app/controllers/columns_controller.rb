class ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.find(params[:id])
    @viewed = params[:id].to_i * 100 / Column.count
    begin
      @next_column = Column.find(params[:id].to_i + 1)
      @prev_column = Column.find(params[:id].to_i - 1)
    rescue
    end
  end
end
