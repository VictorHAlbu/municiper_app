Rails.application.routes.draw do
  resources :residents, only: %i[index create update new]

  root 'residents#index'
end
