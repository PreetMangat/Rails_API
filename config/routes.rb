Rails.application.routes.draw do
  devise_for :users
  
  #Devise config:
  root to: "home#index"
end
