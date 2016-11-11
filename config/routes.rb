Rails.application.routes.draw do
  resources :shopping_items, only: [:index, :create, :destroy, :show]

  root 'application#home'
end
