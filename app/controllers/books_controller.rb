class BooksController < ApplicationController

  def index
    @books = Book.all
    @booknew = Book.new
    @userinfo = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @booknew = Book.new
    @userinfo = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    @booknew.save
    redirect_to book_path(@booknew.id)
  end


   private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end