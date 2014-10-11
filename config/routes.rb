Rails.application.routes.draw do

  resources :service_requests, only: [:new, :create]

  match "/contact" => "pages#contact", via: :get
  match "/privacy" => "pages#privacy", via: :get
  match "/product" => "pages#product", via: :get

  root "welcome#index"

end
