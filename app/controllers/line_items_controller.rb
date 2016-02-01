class LineItemsController < ApplicationController
  authorize_resource
  before_action :set_cart, only: [:new, :create, :update]

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

 
  # POST /line_items
  # POST /line_items.json
  def create
    food = Food.find(params[:food_id])
    respond_to do |format|
      if @cart.add_food(food.id)
        format.js
        format.html { redirect_to :root }
      else
        format.html { render :new }
      end
    end
  end

 

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_path, notice: 'Line item was successfully destroyed.' }
    end
  end

  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:food_id)
  end
  
end
