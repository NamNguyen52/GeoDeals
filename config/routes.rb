Rails.application.routes.draw do

  get 'password_resets/new'

  get 'lists/new'

  get 'lists/create'

  get 'lists/index'
  patch '/businesses/:id' => 'businesses#update', as: :business_update

  get '/business/deals' => 'deals#index', as: :index
  post '/business/:id/deals/new' => 'deals#create', as: :create
  get '/business/:id/deals/new' => 'deals#new', as: :deal_new
  get '/business/deals/:id/edit' => 'deals#edit', as: :deal_edit
  patch '/business/deals/:id/edit' => 'deals#update', as: :deal_update
  delete 'business/deals/:id' => 'deals#destroy', as: :deal_delete
  get 'business/deals/:id/show' => 'deals#show', as: :deal_show


  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # resources :sessions
  # resources :users

  root 'sessions#index'
  
  # root "users#show"

  get 'users/new' => 'users#new', as: :users_new
  post 'users/new' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  patch '/users/:id' => 'users#edit', as: :update_user
  get '/sessions' => 'sessions#index', as: :sessions
  get '/users' => 'users#index', as: :user_index   # Newly added
  get 'sessions/business_index/', :to => 'sessions#business_index', as: :business_index
  get 'sessions/settings/', :to => 'sessions#settings', as: :settings
  get '/signin', to: 'sessions#new', as: :sessions_new
  post '/signin', to: 'sessions#create', as: :sign_in
  delete '/sessions' => 'sessions#destroy', as: :sign_out
  delete '/users/:id' => 'sessions#destroy', as: :log_out

  # API@user = current_user
  scope '/api' do
    resources :users, defaults: {format: 'json'}
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
