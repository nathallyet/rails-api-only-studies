Rails.application.routes.draw do
  # para usar o devise auth token
  mount_devise_token_auth_for 'User', at: 'auth'
  
  resources :kinds

  api_version(:module => "V1", :path => {:value => "v1"}) do
    # resources :auths, only: [:create]
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phone, only: [:create, :update, :destroy]
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:create, :update, :destroy], path: 'relationships/phone'

      resource :address, only: [:show, :create, :update, :destroy]
      resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/address'
    end
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phone, only: [:create, :update, :destroy]
      resource :phones, only: [:show], path: 'relationships/phones'
      resource :phone, only: [:create, :update, :destroy], path: 'relationships/phone'

      resource :address, only: [:show, :create, :update, :destroy]
      resource :address, only: [:show, :create, :update, :destroy], path: 'relationships/address'
    end
  end
end
