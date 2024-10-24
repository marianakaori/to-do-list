Rails.application.routes.draw do
    root "home#index"

    resources :lists do
        resources :items, only: %i[ create ]
    end
end
