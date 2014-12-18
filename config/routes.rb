Rails.application.routes.draw do

  resources :service_requests, only: [:new, :create]

  match "/contact" => "pages#contact", via: :get
  match "/privacy" => "pages#privacy", via: :get
  match "/product" => "pages#product", via: :get

  match "214783d5702b0c95f5911a6e14b83ceb.txt" => "pages#md5", via: :get 

  root "welcome#index"

end
