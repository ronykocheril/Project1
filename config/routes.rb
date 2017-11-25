Rails.application.routes.draw do
  get 'cart/index'

  get 'about/index'
  get 'about/contact'
  get 'product/index'
  get 'product/sort/:sort', to: 'product#sort', as: 'sort'

  get '/:number', to: 'product#show', as: 'show', number: /\d+/
  get '/search', to: 'product#search_display', as: 'search'
  get '/category_search', to: 'home#search_display', as: 'category_search'

  root to: 'home#index'

  post '/cart_display/:id/add_to_cart' => 'cart_display#add_to_cart', as: :add_to_cart_product

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
