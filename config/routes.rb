Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'flights#index'

  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create, :show] do
    collection do
      get :search
    end
  end

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
end
