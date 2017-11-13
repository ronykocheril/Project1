Rails.application.routes.draw do
  get 'product/index'

  get '/:number', to: 'product#show', as: 'show', number: /\d+/

  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
