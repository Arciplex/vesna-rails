Rails.application.routes.draw do

  resources :service_requests, only: [:new, :create]

  match "/contact" => "pages#contact", via: :get
  match "/privacy" => "pages#privacy", via: :get
  match "/product" => "pages#product", via: :get

  match "9930C656881A4D935E5D50D2FD7F6F35.txt" => "pages#md5", via: :get 

  root "welcome#index"

end
