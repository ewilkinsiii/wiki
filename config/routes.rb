Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  get '/myarticles' => 'users#article'
  
  resources :groups, only: [:index, :show] do
    get '/myarticles' => 'users#article'
    resources :categories, except: [:index] do
      collection do
    		  get 'search'
    	 end
      resources :articles do
        collection do
    		  get 'search'
    		  get :deleted
    	  end
    	  resources :versions, only: [:destroy] do
           member do
            get :diff, to: 'versions#diff'
            patch :rollback, to: 'versions#rollback'
          end
        end
      end
    end
  end
  get 'tags/:tag', to: 'category#show', as: :tag
  
  resources :versions, only: [] do
    member do
      patch :bringback  # <= and that
    end
  end
  mount ActionCable.server => '/cable'
  root to: "groups#index"
end
