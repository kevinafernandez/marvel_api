Rails.application.routes.draw do

  resources :characters, only: [:index, :show]
  resources :personas do
	member do
      get :revivir
  	end
  end 
  resources :rankings, only: [:index] do
  	member do
  	 get :reset_ranking
  	end 
  end 
  resources :peleas
  root :to => "home#index" #vista de inicio

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
