Rails.application.routes.draw do
  devise_for :users, defaults: {format: :json}, :controllers => {sessions: 'sessions', registrations: 'registrations'}  
  
  #Devise config:
  root to: "home#index"
end
