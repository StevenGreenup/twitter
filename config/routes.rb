Rails.application.routes.draw do

  root "home#index"



get "registration" => "users#new",  as: :new_user
post "registration" => "users#create", as: :create_user
get "users/:id" => "users#show", as: :user

get "users" => "users#index", as: :users
get 'following' => 'users#following', as: :following
post 'follow/:user_id' => 'users#follow', as: :follow
post 'unfollow/:user_id' => 'users#unfollow', as: :unfollow


post "tweets" => "tweets#create"
get "tweets/new" => "tweets#new", as: :new_tweet
post "favorite/:id/user/:user_id" => "tweets#favorite", as: :favorite
post "unfavorite/:id/user/:user_id" => "tweets#unfavorite", as: :unfavorite
get 'tweets/:id/edit' => 'tweets#edit', as: :edit_tweet
patch 'tweets/:id' => 'tweets#update', as: :tweet
delete 'tweets/:id' => 'tweets#destroy', as: :delete


post "tweet/:tweet_id/comments" => "comments#create", as: :comments
get "tweet/:tweet_id/comments/new" => "comments#new", as: :new_comment


get "sign_in" => "sessions#new", as: :sign_in
post "sign_in" => "sessions#create"
delete "sign_in" => "sessions#delete"
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
