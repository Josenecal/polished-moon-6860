class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @manufacturers = @item.manufacturers
  end

end
