class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource

  def index
    if current_user.has_role?(:admin)
      @books = Book.all 
    elsif current_user.has_role?(:reviewer)
      @books = Book.all
    else
      @books = current_user.books.all  
    end
  end

  def show
    set_comment
  end

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

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.' 
    else
      render :edit
    end  
  end


  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_comment
    @comments = @book.comments
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :image)
  end
end
