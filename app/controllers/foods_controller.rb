class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_food


  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    if @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_path, notice: 'Food was successfully destroyed.' }
      
    end
    else
     respond_to do |format|
      format.html { redirect_to foods_path, notice: 'Food cannot be destroyed as an order contains it' }
      
    end
   end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  def invalid_food
    logger.error "Attempt to access invalid food resource #{params[:id]}"
    redirect_to :root, notice: 'Invalid Food Item'
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_params
    params.require(:food).permit(:title, :description, :category_id,:image_url, :price)
  end
   
end
