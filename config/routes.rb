Rails.application.routes.draw do
  # Root path
  root 'products#index'

  # Resources
  resources :products
  resources :line_items
  resource  :cart, only: [:index, :show, :delete]
  patch 'update_cart/:id' => 'carts#update', as: 'update_cart'
end
