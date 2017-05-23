Rails.application.routes.draw do
  resources :fan_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books
  
  #４章
  get 'view/keyword'
  post 'keyword/search'
end
