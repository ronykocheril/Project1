Rails.application.routes.draw do
  get 'product/index'

  get '/:number', to: 'product#show', as: 'show', number: /\d+/
  get '/search', to: 'product#search_display', as: 'search'
  get '/category_search', to: 'home#search_display', as: 'category_search'

  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
