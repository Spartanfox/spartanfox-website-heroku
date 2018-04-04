Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  get '/contact', to: 'static_pages#contact'
  devise_for :users, :controllers => { registrations: 'devise_override/registrations' }

  resources :categories do
    resources :topics
  end
  resources :topics do
    resources :messages
  end
  resources :downloads
end
