Rails.application.routes.draw do
  get 'wines/index' 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  }
  # get "users/show" => "users#show"

  root 'wines#index'
  resources :wines do
    collection do
      post :confirm
    end
  end

  resources :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
