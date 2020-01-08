Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :registrations, only: [] do
        collection do
          post :sign_up
          post :forgot_password
          post :reset_password
        end
      end
      resources :sessions, only: [] do
        collection do
          delete :destroy
          post :sign_in
        end
      end
    end
  end
end
