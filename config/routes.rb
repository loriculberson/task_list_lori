Rails.application.routes.draw do
 
  root "home#index"

  resources :lists do 
    resources :tasks do 
      delete  "/delete_image"  =>  "tasks#delete_image"
    end
  end
end
