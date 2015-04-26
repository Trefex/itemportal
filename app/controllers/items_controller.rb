class ItemsController < ApplicationController

  http_basic_authenticate_with name: "trefex", password: "trefex", except: [:index, :show]

  def index
    @items = Item.all.page params[:page]
  end

  # Show action
  def show
    @item = Item.find(params[:id])
  end

  # New action
  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  # Create action
  def create
    #render plain: params[:items].inspect
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    #@item.avatar = nil
    #@item.save

    redirect_to items_path
  end

  private
    def item_params
      params. require(:item).permit(:title, :text, :trainimage)
  end

end
