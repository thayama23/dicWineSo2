Rails.application.routes.draw do
  # get 'wines/index' 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',  
    # confirmations: 'users/confirmations'
    # confirmations: 'confirmations'
  }


  root 'wines#index'
  resources :wines do
    resources :comments
    collection do
      post :confirm
    end
  end

  resources :users
  resources :favorites, only: [:index, :create, :destroy]


  # if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
