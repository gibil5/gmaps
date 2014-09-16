
# jr@oblique:  10/9/14


Rails.application.routes.draw do


  get 'points/new'

  #get 'maps/new'
  #get 'maps/create'
  #get 'maps/show'

  resources :restaurants
  resources :maps
  resources :points

#         url           controller action                 http request 
  root  'static_pages#home'


  match '/help',            to: 'static_pages#help',          via: 'get'
  match '/map1',            to: 'static_pages#map1',          via: 'get'
  match '/map2',            to: 'static_pages#map2',          via: 'get'

  #match '/restaurants/:id',  to: 'restaurants#update',        via: 'post'
  match '/restaurants/:id/edit',  to: 'restaurants#edit',   via: 'put'


#  match '/restaurants', to: 'restaurants#new',            via: 'get'


  #restaurants_new GET  /restaurants/new(.:format) restaurants#new


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
