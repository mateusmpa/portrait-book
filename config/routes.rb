Rails.application.routes.draw do
  devise_for :users
  resources :portraits do
    member do
      put "like", to: "portraits#upvote"
    end    
  end

  root "portraits#index"
end
