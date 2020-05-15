Rails.application.routes.draw do
  resources :offers
  root 'home#index'
end
