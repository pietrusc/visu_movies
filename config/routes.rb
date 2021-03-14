Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :create]
  post '/sign_into_newsletter/', to: 'customers#sign_into_newsletter'
end
