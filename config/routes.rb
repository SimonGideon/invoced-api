Rails.application.routes.draw do
  devise_for :users
  namespace :v1, default: { format: :json } do
    resources :contacts
    resource :sessions, only: %i[create destroy]
  end
end
