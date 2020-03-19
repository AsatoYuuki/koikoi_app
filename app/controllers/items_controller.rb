class ItemsController < ApplicationController

def index
  @item = Item.includes(:images).order('created_at DESC').limit(10)
end

def new
  @item = Item.new
  @item.images.new
end

def create
  @item = Item.new(item_params)
  if @item.save
    binding.pry
    respond_to do |format|
      format.html{redirect_to root_path}
      format.json
  end
end
end

private

def item_params
  params.require(:item).permit(:name, :content, :price, :size, :condition, :send_cost, :send_method, :send_place, :send_day, :buyer_id, :status, :brand_id, :category_id, images_attributes: [:url, :id]).merge(user_id: current_user.id)
end

end