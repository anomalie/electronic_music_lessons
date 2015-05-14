Rails.application.routes.draw do

	resources :users

	match 'auth/:provider/callback', to: 'sessions#create_fb', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'contact' => 'static_pages#contact'

  root to: 'static_pages#index'

  namespace :api do
    resources :tutorials do
      resources :lessons
    end
  end

  resources :tutorials

end
