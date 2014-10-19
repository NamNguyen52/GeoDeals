Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # resources :sessions
  # resources :users
  root "sessions#new"

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create', as: :sign_up
  get 'users/:id' => 'users#show', as: :user
  patch '/users/:id' => 'users#update', as: :update_user
  get '/sessions' => 'sessions#index'
  get '/signin', to: 'sessions#new', as: :sessions_new
  post '/signin', to: 'sessions#create', as: :sign_in
  delete '/sessions' => 'sessions#destroy', as: :sign_out
  patch '/sessions' => 'friendships#update', as: :update_friendship
  delete '/users/:id' => 'sessions#destroy', as: :log_out

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