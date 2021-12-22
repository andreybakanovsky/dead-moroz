Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'  

  devise_for :users, skip: :all
  devise_scope :user do
    scope :authentication, defaults: { format: :json } do
      post   '/sign_in',        to: 'devise/sessions#create'
      delete '/sign_out',       to: 'devise/sessions#destroy'
      post   '/sign_up',        to: 'devise/registrations#create'
      put    '/account_update', to: 'devise/registrations#update'
      delete '/account_delete', to: 'devise/registrations#destroy'
    end
  end

  resources :users, only: [:index, :show]  do
    resources :goods do 
      resources :gifts
      resources :reviews do
        resources :gifts
      end
    end
    resources :karmas
    resources :invitations
  end
 
  resource :profile, only: [:show], controller: 'users/profiles'
end