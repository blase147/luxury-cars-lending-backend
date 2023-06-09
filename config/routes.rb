Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root 'cars#index'
  get '/current_user', to: 'current_user#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :reservations, only: [:index, :create, :destroy]
      end
      resources :cars, only: [:index, :show, :create, :destroy]
    end
  end

    devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

end
