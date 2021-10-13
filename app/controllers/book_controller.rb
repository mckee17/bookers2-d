class BookController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def show
    @book = book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redilect_to root.path
  end
  
  def edit
    @book = book.find(params[:id])
    @book.update
    redirect_to root.path
  end
  
  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to root.path
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
