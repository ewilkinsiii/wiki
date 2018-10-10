Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  get '/myarticles' => 'users#article'
  
  resources :categories do
    collection do
  		  get 'search'
  	 end
    resources :articles do
      collection do
  		  get 'search'
  	  end
  	  resources :versions, only: [:destroy] do
         member do
          get :diff, to: 'versions#diff'
          patch :rollback, to: 'versions#rollback'
        end
      end
    end
  end
  root to: "categories#index"
end
