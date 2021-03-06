Chianti::Application.routes.draw do

  #get "sessions/new"

  #get "users/new"

  namespace :admin do
    resources :users do
    end
    resources :sessions do
    end
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "log_in" => "sessions#new", :as => "log_in"
    get "sign_up" => "users#new", :as => "sign_up"


    resources :wines do
    end

    resources :wine_categories do
      member do
        get 'remove_banner'
      end
      resources :wines
    end
    resources :wineries do
      member do
        get 'remove_banner'
      end
    end

    resources :pages do
      member do
        get 'remove_banner'
      end
    end
  end

  resources :admin do
    collection do
      get :login
      post :login_submit
    end
  end

  resource :cart do
    resource :checkout do
      member do
        get :details
        get :success
      end
      resources :orders
    end
  end

  resources :wines do
    resource :cart
  end

  match '/wines/category/:title', :controller => "wines/categories", :action => :show
  match '/wines/:category(/:id)', :to => 'wines#show'
  resources :wineries

  resource :contact

  match ':title', :controller => :pages, :action => :show

  root :to => "pages#index"
end
