Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: :all

  scope :api, defaults: { format: :json } do
    scope :v1 do
      scope :authentication do
        devise_scope :user do
          post   '/sign_in',        to: 'devise/sessions#create'
          delete '/sign_out',       to: 'devise/sessions#destroy'
          post   '/sign_up',        to: 'api/v1/users/registrations#create'
          patch  '/account_update', to: 'api/v1/users/registrations#update'
          delete '/account_delete', to: 'api/v1/users/registrations#destroy'
        end
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      root to: 'users#index'         
      resources :users, only: [:index, :show]  do 
        member do
          get 'average_grade'
          get 'good_years'
          get 'requested_gifts/:year', to: 'users#requested_gifts'
          get 'reviews/:year', to: 'users#reviews'
          get 'suggested_gifts/:year', to: 'users#suggested_gifts'
        end
        resources :goods do 
          member do
            get 'translate'
          end
          resources :gifts do
            collection do
              get 'translate'
            end
          end
          resources :reviews do
            resources :gifts, controller: 'gift_suggestions'
          end
        end
        resource :karma, only: [:show] do
          member do
            get 'approved_gifts'
          end
        end
      end
      resources :invitations do
        member do
          get 'send_by_email'
        end
      end
      resource :profile, only: [:show], controller: 'users/profiles'
      patch 'gifts/:id', to: 'gifts#update_dead_choice'
    end
  end
end