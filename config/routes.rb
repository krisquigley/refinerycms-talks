Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :talks, :path => '/teachings/talks' do
    root :to => "talks#index"
    resources :talks, :path => '', :only => [:index, :show] do
      collection do
        resources :teachers, :only => :show
      end
    end
  end

  # Admin routes
  namespace :talks, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :talks, :except => :show do
        collection do
          post :update_positions
        end
      end
      resources :teachers, :except => :show
    end
  end

end
