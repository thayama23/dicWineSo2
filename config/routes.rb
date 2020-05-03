Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

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
