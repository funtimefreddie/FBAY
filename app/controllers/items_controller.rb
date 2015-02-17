class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # layout 'header'

  # GET /items
  # GET /items.json

  def welcome
  end
  
  def index
    @category_id = params[:filtered_category_id].to_i
    @user_id = user_signed_in? ? current_user.id : 0     
    @items = @category_id == 0 ? Item.not_user(@user_id) : Item.not_user(@user_id).category(@category_id)
  end

  def my_items
    @items = current_user.items
  end

  def bidded_items
    @items = current_user.bidded_items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @bid = Bid.new
  end

  # GET /items/new
  def new
    @item = Item.new
  end



  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
  
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      # byebug
      params.require(:item).permit(:name, :description, :category_id, :picture, :duration, :user_id, :bid_limit)
    end
end
