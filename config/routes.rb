Rails.application.routes.draw do
  resources :fan_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books
  
  #４章
  get 'view/keyword'
  post 'keyword/search'# TODO: 後で実装？
  get 'view/form_tag'
  post 'view/create' # TODO: 後で実装？
  get 'view/form_for'
  get 'view/field'
end
