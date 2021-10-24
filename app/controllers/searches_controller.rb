class SearchesController < ApplicationController
  def search
    if params[:search_model] == 'user'

      if params[:search_match] == 'exact'
        @users_search = User.where('name LIKE ?', params[:search])
      elsif params[:search_match] == 'forward'
        @users_search = User.where('name LIKE ?',"#{params[:search]}%")
      elsif params[:search_match] == 'backward'
        @users_search = User.where('name LIKE ?',"%#{params[:search]}")
      elsif params[:search_match] == 'partial'
        @users_search = User.where('name LIKE ?',"%#{params[:search]}%")
      end

    elsif params[:search_model] == 'book'

      if params[:search_match] == 'exact'
        @books_search = Book.where('title LIKE ?', params[:search])
      elsif params[:search_match] == 'forward'
        @books_search = Book.where('title LIKE ?',"#{params[:search]}%")
      elsif params[:search_match] == 'backward'
        @books_search = Book.where('title LIKE ?',"%#{params[:search]}")
      elsif params[:search_match] == 'partial'
        @books_search = Book.where('title LIKE ?',"%#{params[:search]}%")
      end

    end
  end
end
