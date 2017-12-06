Rails.application.routes.draw do

  devise_for :users
  get 'charges/new'

  get 'charges/create'
  resources :charges, only: [:new, :create]

  get 'about/index'
  get 'about/contact'
  get 'product/index'
  get 'product/sort/:sort', to: 'product#sort', as: 'sort'

  get '/:number', to: 'product#show', as: 'show', number: /\d+/
  get '/search', to: 'product#search_display', as: 'search'
  get '/category_search', to: 'home#search_display', as: 'category_search'

  root to: 'home#index'

  post '/cart/:id/cart_display' => 'cart#cart_display', as: :cart_display
  get '/cart/index', to: 'cart#index', as: 'cart_home'
  get '/cart/:id/delete_item_from_cart', to: 'cart#delete_item_from_cart', as: 'delete_item_from_cart'
  get '/cart/checkout', to: 'cart#checkout', as: 'checkout'

  devise_for :users, skip: :all

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
