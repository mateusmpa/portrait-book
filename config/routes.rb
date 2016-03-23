Rails.application.routes.draw do
  resources :portraits

  root "portraits#index"
end
