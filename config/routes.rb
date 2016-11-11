Rails.application.routes.draw do
  resources :shopping_items, only: [:index, :create, :destroy, :show, :update]

  root 'application#home'
end
