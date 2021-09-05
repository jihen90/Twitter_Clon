Rails.application.routes.draw do

  #api

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'news', to: 'tweets#news'
      get ':start_date/:end_date', to: 'tweets#by_date'
      post 'tweet_from_api', to: 'tweets#tweet_from_api'
    end
  end

  #activeAdmin

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #rutas devise para users
  devise_for :users

  #rutas para acción de follow y unfollow
  resources :users, only: %i[show]
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  #rutas para tweets, retweets y likes
  resources :tweets do
    resources :likes
    member do
      post 'retweet'
    end
  end
  
  #index de tweets como raiz
  root 'tweets#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
