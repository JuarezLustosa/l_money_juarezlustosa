Rails.application.routes.draw do
  namespace :admin do
    resources :offers do
      post :disabled
      post :enabled
    end
  end
  root 'home#index'
end
