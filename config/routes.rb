Rails.application.routes.draw do
  # Devise routes for login/signup
  devise_for :users

  # Root path
root "home#index"



  # Static Pages
  get '/about', to: 'pages#about', as: 'about'

  # Books routes + nested borrow route
  resources :books do
    post 'borrow', to: 'borrowings#create', on: :member
  end

  # Borrowings routes
  resources :borrowings, only: [:index] do
    member do
      patch :extend_borrowing
      patch :return
     
    end
     collection do
    get :receipt_pdf  
  end
  end

  # Profile routes
  resource :profile, only: [:show, :edit, :update]
  resources :profiles, only: [:index] # Admin only

  # Health check and PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  get 'admin/borrowings', to: 'admin#borrowings', as: 'admin_borrowings'

  namespace :admin do
  get 'statistics', to: 'statistics#index', as: 'statistics'
end



end
