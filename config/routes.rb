Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :jobs, except: [:delete]
  resources :companies, except: [:delete]
  resources :categories, only: [:show, :new, :create]
end
