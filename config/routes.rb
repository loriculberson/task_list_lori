Rails.application.routes.draw do
 
  root "home#index"

  resources :lists do 
    resources :tasks do 
    end
  end
end
