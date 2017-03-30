Rails.application.routes.draw do
  #session#
  root 'session#index'
  post '/login' => 'session#login'
  post '/register' => 'session#register'
  get '/agency' => 'session#agency'
  delete '/logout' => 'session#logout'

  #agency#
  get '/agency/:agency_id' => 'agency#show'
  patch '/agency/:agency_id' => 'agency#update'
  delete '/agency/:agency_id' => 'agency#destroy'
  get '/agency/:agency_id/dashboard' => 'agency#dashboard'
  get '/agency/:agency_id/animal/all' => 'agency#all'

  #message#
  get '/agency/:agency_id/message' => 'message#agency_index'
  get '/agency/:agency_id/message/:message_id' => 'message#agency_show'
  post '/agency/:agency_id/message/:message_id' => 'message#agency_reply'
  get '/user/:user_id/message' => 'message#user_index'
  post '/user/:user_id/message' => 'message#user_create'
  get '/user/:user_id/message/:message_id' => 'message#user_show'
  post '/user/:user_id/message/:message_id' => 'message#user_reply'

  #animal#
  get '/animal/:animal_id' => 'animal#show'
  delete '/animal/:animal_id' => 'animal#destroy'
  get '/agency/:agency_id/animal' => 'animal#create'
  get '/agency/:agency_id/animal/:animal_id' => 'animal#agency'
  patch '/agency/:agency_id/animal/:animal_id' => 'animal#update'

  #post#
  post '/agency/:agency_id/animal/:animal_id' => 'post#create'
  patch '/agency/:agency_id/animal/:animal_id/post/:post_id' => 'post#update'
  delete '/agency/:agency_id/animal/:animal_id/post/:post_id' => 'post#destroy'

  #adoption#
  get '/agency/:agency_id/adoption' => 'adoption#index'
  post '/agency/:agency_id/adoption' => 'adoption#create'
  get '/agency/:agency_id/adoption/:adoption_id' => 'adoption#show'
  patch '/agency/:agency_id/adoption/:adoption_id' => 'adoption#update'
  patch '/agency/:agency_id/adoption/:adoption_id/status' => 'adoption#status'
  delete '/adoption/:adoption_id' => 'adoption#destroy'

  #foster#
  get '/agency/:agency_id/foster' => 'foster#index'
  post '/agency/:agency_id/foster' => 'foster#create'
  get '/agency/:agency_id/foster/:foster_id' => 'foster#show'
  patch '/agency/:agency_id/foster/:foster_id' => 'foster#update'
  patch '/agency/:agency_id/foster/:foster_id/status' => 'foster#status'
  delete '/foster/:foster_id' => 'foster#destroy'

  #user#
  get '/dashboard' => 'user#dashboard'
  get '/user/:user_id' => 'user#show'
  post '/user/:user_id/contact' => 'user#create_contact'
  post '/user/:user_id/family' => 'user#create_family'
  post '/user/:user_id/pet' => 'user#create_pet'
  post '/user/:user_id/vet' => 'user#create_vet'
  patch '/user/:user_id/contact' => 'user#update_contact'
  patch '/user/:user_id/family' => 'user#update_family'
  patch '/user/:user_id/pet' => 'user#update_pet'
  patch '/user/:user_id/vet' => 'user#update_vet'
  delete '/user/:user_id' => 'user#destroy'

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
