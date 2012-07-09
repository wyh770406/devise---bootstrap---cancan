Luna::Application.routes.draw do
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  match "/admin"=>"admin#index", as: :admin_root
  get "settings/lang"

  authenticated :user do
    root :to => 'home#index'
  end
  #  authenticated :admin do
  #    root :to => 'admin#index'
  #  end
  root :to => "home#index"
  devise_for :users, :controllers => { :sessions => "sessions" }
  resources :logs  do
    collection do
      post 'logtofile'
    end
  end
  resources :settings do
    collection do
      get 'set_client_cookie'
      get 'get_client_cookie'
    end
  end

  resources :users  do
    collection do
      get 'verify_encrypted_password'
      post 'change_encrypted_password'
    end
  end

  namespace :adminpanel do
    resources :users do 
      member do
        post 'enable'

      end
    end

    resources :session_levels do
      member do
        post 'move_down'
        post 'move_up'
      end
    end
    
    resources :devices do
      collection do
        get 'noregistration'

      end
      member do
        get 'noregistration_detail'
        get 'assign_user'
        post 'remove'
        post 'assign'
      end
    end

    resources :callno_pools do
      member do
        post 'set_default'
      end
    end
  end
end
