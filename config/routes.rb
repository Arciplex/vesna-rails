Rails.application.routes.draw do

  resources :service_requests, only: [:new, :create]

  root "welcome#index"

end
