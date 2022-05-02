Rails.application.routes.draw do
  root 'home#index'

  resources :people
  resources :envelope_formulas, except: [:show]
  resources :profits, except: [:show]
  devise_for :users, skip: %i[password registrations sessions], controllers: {
    sessions: 'users/sessions'
  }
  as :user do
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :galleries
  resources :users

  get '/partners/:id', to: 'partners#partner_gallery', as: 'partner_gallery'
  get '/favorites', to: 'galleries#favorites', as: 'favorites'
  get '/candidates', to: 'partners#candidates'
  get '/partners', to: 'partners#index'
  post '/partners/new_request', to: 'partners#new_request'
  post '/partners/approve_or_deny_request', to: 'partners#approve_or_deny_request'
  post '/partners/remove_request', to: 'partners#remove_request'
end
