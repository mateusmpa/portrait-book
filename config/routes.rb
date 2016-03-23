Rails.application.routes.draw do
  devise_for :users
  resources :portraits

  root "portraits#index"
end
