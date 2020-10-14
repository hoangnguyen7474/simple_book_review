class CategoriesController < ApplicationController
  before_action :authenticate_user
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index    
    @categories = Category.category_all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save        
      redirect_to categories_path, notice: 'Category was successfully created.' 
    else
      render :new 
    end      
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.' 
    else
      render :edit
    end  
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: 'Category was successfully destroyed.'
    else
      redirect_to root_path, notice: 'Category was not destroyed.'
    end
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end