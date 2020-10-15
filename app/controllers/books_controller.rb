class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_comment, only: [:show]

  load_and_authorize_resource :except => [:show]

  def index
    @books =
      if current_user.has_any_role?(:admin, :reviewer)
        Book.all
      else
        current_user.books.all
      end
  end

  def show; end

  def new    
    @book = current_user.books.new
  end  

  def create
    @book = current_user.books.new(book_params)
   
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new 
    end      
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end  
  end

  def destroy
    if @book.destroy
      redirect_to books_url, notice: 'Book was successfully destroyed.'
    else
      redirect_to root_url, notice: 'Book was not destroyed.'
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_comment
    @comments = @book.comments
  end

  def set_category
    @categories = Category.all      
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :photo, :category_id)
  end
end
