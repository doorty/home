Src::Application.routes.draw do

  # CareFinder api_method
  get 'care_finder/doctors', :to => 'care_finder#doctors'
  get 'care_finder/doctors_count', :to => 'care_finder#doctors_count'
  get 'care_finder/doctor_details', :to => 'care_finder#doctor_details'
  get 'care_finder/doctor_reviews', :to => 'care_finder#doctor_reviews'
  get 'care_finder/doctor_reviews_count', :to => 'care_finder#doctor_reviews_count'
  get 'care_finder/doctor_similar_names', :to => 'care_finder#doctor_similar_names'
  
  resources :caregivers

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'care_circles' => 'care_circles#index', as: :user_root
	#get "dashboard", :to => "dashboard#index"
  get "about", :to => "welcome#about"
  get "contact", :to => "welcome#contact"
	
	# support for facebook
	get "auth/:provider/callback", :to => "sessions#create"
  get "auth/failure", :to => redirect("/")
  #get "signout", to: "sessions#destory", as: "signout"
    
  #devise_for :users
  devise_for :users, :controllers => {
  	:registrations => "users/registrations",
  	:sessions => "users/sessions",
  	:passwords => "users/passwords",
  	:invitations => 'users/invitations',
  	:omniauth_callbacks => "omniauth_callbacks"
  }

	devise_scope :user do
	  post  'users/invitation/invite_fb_friends', :to => 'users/invitation#invite_fb_friends'
	end
  
	resources :care_circles do
  	resources :statuses
		resources :appointments
		resources :medications
		resources :notes
		resources :doctors
		resources :charts
		get "emergency" => "emergency#index"
		#get 'foo' => 'controller#index' # maps to /care_circles/foo
	end

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
