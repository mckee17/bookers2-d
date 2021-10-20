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
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    if @booknew.save
      redirect_to book_path(@booknew.id), notice:'You have created book successfully.'
    else
      @userinfo = current_user
      @books = Book.all
      render :index
    end
  end


 private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end