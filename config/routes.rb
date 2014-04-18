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
  match '/delete' => 'words#delete', :as => :delete
  match '/approve' => 'words#list_unapproved', :as => :approve
  match '/update' => 'words#update', :as => :update
  match '/save_review' => 'words#save_review', :as => :save_review
  match '/review' => 'words#review', :as => :review

  match '/signup' => 'users#signup', :as => :signup
  match '/save_user' => 'users#save', :as => :save_user
  match '/login' => 'users#login', :as => :login
  match '/authenticate' => 'users#authenticate', :as => :authenticate
  match '/logout' => 'users#logout', :as => :logout

  match '/edit_profile' => 'users#edit', :as => :edit_profile

  match '/about' => 'about#about_zodic', :as => :about
  match '/thlukna' => 'about#thlukna', :as => :thlukna

end
