Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as: 'about'
  get '/users/:user_id/relationships/follow' => 'relationships#follow',as: 'follow_user'
  get '/users/:user_id/relationships/follower' => 'relationships#follower',as: 'follower_user'

  resources :books, only:[:index,:show,:create,:edit,:update,:destroy] do
    resource :favorites, only:[:create,:destroy]
    resources :book_comments,only:[:create,:destroy]
  end

  resources :users, only:[:index,:show,:edit,:update] do
    resources :relationships,only:[:create,:destroy]
  end
end
