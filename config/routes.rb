Rails.application.routes.draw do
  get 'index/create'

  get 'index/show'

  get 'index/update'

  get 'index/destroy'

  resources :lists, except: [:new, :edit]

  match "*path", to: "lists#index", via: "get"

  root 'books#index'
end
