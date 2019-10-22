Rails.application.routes.draw do
  devise_for :users, skip: [:sessions,:registrations,:passwords]
  
  as :user do

    post 'users', to: 'registrations#create', as: :new_user, defaults: {format: :json}
    patch 'users', to: 'registrations#update', as: :update_user, defaults: {format: :json}
    delete 'users', to: 'registrations#destroy', as: :delete_user, defaults: {format: :json}

    post 'users/sign_in', to: 'sessions#create', as: :sign_in_user, defaults: {format: :json}
    delete 'users/sign_out', to: 'sessions#destroy', as: :sign_out_user, defaults: {format: :json}

  end
  
  #Devise config:
  root to: "home#index"
end
