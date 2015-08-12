Rails.application.routes.draw do
 
  root "home#index"

  resources :lists do 
      get "/export" => "lists#export"
      collection { post :import }
    resources :tasks do 
      delete  "/delete_image"  =>  "tasks#delete_image"
    end
  end
end
