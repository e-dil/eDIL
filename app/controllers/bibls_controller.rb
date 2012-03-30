class BiblsController < ApplicationController
  def index
    @bibls = Bibl.order(:str)
  end
end
