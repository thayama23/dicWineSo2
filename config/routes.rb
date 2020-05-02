Rails.application.routes.draw do
  resources :wines do
    collection do
      post :confirm
    end
  end
end
