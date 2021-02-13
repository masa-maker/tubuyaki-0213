Rails.application.routes.draw do
  get 'messages/new'
  root to:'homes#index'
  resources :lists, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :messages, only: [:new, :create, :destroy]
end
