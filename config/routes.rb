ActionController::Routing::Routes.draw do |map|
#  map.index '/', :controller => 'pages', 
#                 :action => 'show', 
#                 :id => '1-about'

  map.index '/', :controller => 'pages', 
                 :action => 'index'

  map.resources :pages, :collection => { :admin => :get }
  map.resources :users
  map.resources :photos, :collection => { :admin => :get }

  map.resources :users, :member => { :enable => :put } do |users|
    users.resources :roles
  end

  map.show_user '/user/:username', 
                 :controller => 'users', 
                 :action => 'show_by_username'

  map.resources :events, :collection => {:admin => :get}
  map.resources :sports, :collection => {:admin => :get}
  map.resources :foods, :collection => {:admin => :get}

  map.resources :pages, :collection => {:admin => :get} do |pages|
    pages.resources :events, :name_prefix => 'page_'
    pages.resources :sports, :name_prefix => 'page_'
    #pages.connect 'events/:year/:month', :controller => 'events'
  end

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
