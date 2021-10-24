class SearchesController < ApplicationController
  def search
    if params[:search_select] == 'user'
      @users_search = User.where('name LIKE ?',"%#{params[:search]}%")

    elsif params[:search_select] == 'book'
      @books_search = Book.where('title LIKE ?',"%#{params[:search]}%")
    end
  end
end
