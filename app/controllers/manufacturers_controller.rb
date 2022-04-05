class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.map_items
  end

end
