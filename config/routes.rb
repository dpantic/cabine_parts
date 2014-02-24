SampleApp::Application.routes.draw do
  
  resources :materials do
    collection { post :import }
  end

  resources :ipcboeings do
    collection { post :import }
  end

  resources :spms do
    collection {post :import }
  end

  resources :ipc_airbuses do
    collection { post :import }
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  #resources :ipcboeings,    only: [:new, :create]

  root to: 'static_pages#home'
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  #match '/help',    to: 'static_pages#help',    via: 'get'

  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/import', to: 'ipc_airbuses#index', via: 'get'
  #match '/import', to: 'ipc_airbuses#import', via: 'get'

  match '/spm_list',        to: 'spms#index',         via: 'get'
  match '/ipc_airbus_list', to: 'ipc_airbuses#index', via: 'get'
  match '/ipcboeing_list',  to: 'ipcboeings#index',   via: 'get'
  match '/material_list',   to: 'materials#index',    via: 'get'
end
