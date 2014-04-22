Zodic::Application.routes.draw do
  devise_for :contributors, :controllers => { :sessions => "contributors/sessions", :registrations => "contributors/registrations" }

  get "chibai/index"

  #resources :words

  root :to => "chibai#index"
  match '/search' => 'chibai#search', :as => :search
  match '/contribute' => 'words#contribute', :as => :contribute
  match '/autocomplete' => 'chibai#autocomplete', :as => :suggest
  match '/view_entry' => 'words#show', :as => :view_entry
  match '/index' => 'words#index', :as => :index
  match '/edit' => 'words#edit', :as => :edit
  match '/save' => 'words#save', :as => :save
  match '/view' => 'words#view', :as => :view
  match '/change' => 'words#change', :as => :change
  match '/req_change' => 'words#req_contribute', :as => :req_contribute
  match '/delete' => 'words#delete', :as => :delete
  match '/approve' => 'words#list_unapproved', :as => :approve
  match '/update' => 'words#update', :as => :update
  match '/self_update' => 'words#self_update', :as => :self_update
  match '/save_review' => 'words#save_review', :as => :save_review
  match '/review' => 'words#review', :as => :review
  match '/request' => 'words#request_def', :as => :request
  match '/list_requests' => 'words#requests_list', :as => :list_requests

  # match '/signup' => 'users#signup', :as => :signup
  match '/save_user' => 'users#save', :as => :save_user
  # match '/login' => 'users#login', :as => :login
  # match '/authenticate' => 'users#authenticate', :as => :authenticate
  # match '/logout' => 'users#logout', :as => :logout
  match '/user_list' => 'users#user_list', :as => :user_list
  match 'deny_admin' => 'users#deny_admin', :as => :deny_admin
  match 'make_admin' => 'users#make_admin', :as => :make_admin
  match 'admin_roles' => 'users#admin_roles', :as => :admin_roles

  match '/edit_profile' => 'users#edit', :as => :edit_profile

  match '/about' => 'about#about_zodic', :as => :about
  match '/thlukna' => 'about#thlukna', :as => :thlukna

end
