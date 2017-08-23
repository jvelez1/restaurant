class DishesController < ApplicationController
  before_action :valid_chef, :authenticate_user!

  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_chef

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = @chef.dishes
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    unless @dish.my_chef?(@chef)
      redirect_to :chef_dishes
    end
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  def create
    @dish = Dish.new(dish_params)
    @dish.chef = @chef
    respond_to do |format|
      if @dish.save
        format.html { redirect_to [@chef, @dish], notice: 'Dish was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /dishes/1

  def update
    respond_to do |format|
      if @dish.my_chef?(@chef)
        if @dish.update(dish_params)
          format.html { redirect_to [@chef, @dish], notice: 'Dish was successfully updated.' }
        else
          format.html { render :edit }
        end
      else
        format.html { redirect_to :chef_dishes }
      end
    end
  end

  # DELETE /dishes/1
  def destroy
    respond_to do |format|
      if @dish.my_chef?(@chef)
        if @dish.active?
          @dish.active = false
        else
          @dish.active = true
        end
        if @dish.save
          format.html { redirect_to :chef_dishes }
        else
          format.html { render :edit }
        end
      else
        format.html { redirect_to :chef_dishes }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def set_chef
      @chef = Chef.find(params[:chef_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.fetch(:dish, {}).permit(:name, :description, :price, :active, :picture)
    end
end
