Rails.application.routes.draw do
  resources :residents

  root 'residents#index'
end
