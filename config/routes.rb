Chianti::Application.routes.draw do

  namespace :admin do
    resources :wines
    resources :wine_categories do
      member do
        get 'remove_banner'
      end
      resources :wines
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

  match '/wines/category/:title', :controller => "wines/categories", :action => :show

  resources :wines do
    resource :cart
  end

  match ':title', :controller => :pages, :action => :show

  root :to => "pages#index"
end
