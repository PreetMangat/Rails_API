Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}  
  
  #Devise config:
  root to: "home#index"
end
