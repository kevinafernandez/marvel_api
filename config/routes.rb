Rails.application.routes.draw do
  resources :characters, only: [:index, :show]
  resources :events
  resources :series
  resources :comics
  resources :personas
  root :to => "home#index" #vista de inicio

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
