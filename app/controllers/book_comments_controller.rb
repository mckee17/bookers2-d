class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save

    else
    @user = @book.user
    @booknew = Book.new
    @userinfo = @book.user
    @book_comment = BookComment.new
    render 'books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id]).destroy
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end