Rails.application.routes.draw do
  resources :items
  resources :groups do
    resources :messages
  end
  post 'authenticate', to: 'authentication#authenticate'
end
