ActionController::Routing::Routes.draw do |map|
  map.resources :locations

  map.resources :product_sub_sections

  map.resources :product_sections

  map.resources :product_categories

  map.create_rassylka 'profiles/rassylka/create', :controller => 'profiles', :action => 'rassylka_create'
  map.new_rassylka 'profiles/rassylka/new', :controller => 'profiles', :action => 'rassylka_new'
  
  map.maplayers 'maplayers/:id', :controller => 'maplayers', :action => 'index'
  
  map.direct 'direct/:id', :controller => 'posts', :action => 'showsinglepost'
  
  map.resources :postfotos

  map.profile 'profile', :controller => 'profiles', :action => 'help'
  map.help_profile 'profile/help', :controller => 'profiles', :action => 'help'
  map.commnents_profile 'profile/comments', :controller => 'profiles', :action => 'showcomments'
  map.blank_profile 'profile/blank', :controller => 'profiles', :action => 'blank'
  map.stat_profile 'profile/stat', :controller => 'profiles', :action => 'statistics'
  map.posts_profile 'profile/posts', :controller => 'profiles', :action => 'showposts'
  map.sendemail_profile '/profile/sendemail', :controller => 'profiles', :action => 'sendemail'

  map.posts_search 'posts/location/:location_id/category/:category_id/section/:section_id/subsection/:subsection_id', :controller => 'posts', :action => 'index'
  map.connect 'posts/location/:location_id/category/:category_id/section/:section_id', :controller => 'posts', :action => 'index'
  map.connect 'posts/location/:location_id/category/:category_id', :controller => 'posts', :action => 'index'
  map.connect 'posts/location/:location_id', :controller => 'posts', :action => 'index'
  # map.connect 'posts/categories', :controller => 'posts', :action => 'index'
  map.resources :posts, :has_many => [ :post_comments ]

  map.resources :forclients
  
  map.resources :nedvjsphotos

  map.resources :nedvjs do |nedvj|
      nedvj.resources :nedvjsphotos
  end

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'

  map.resources :user_sessions

  map.resources :users
  
  map.resources :password_resets
  
  map.aboutus '/aboutus', :controller => 'aboutus', :action => 'index'
  map.services '/services', :controller => 'services', :action => 'index'
  map.contacts '/contacts', :controller => 'contacts', :action => 'index'
  
  map.home '/home', :controller => 'home', :action => 'index'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.root  :controller => 'posts'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
