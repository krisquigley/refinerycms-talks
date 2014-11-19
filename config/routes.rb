Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :talks do
    resources :talks, :path => '', :only => [:index, :show]
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
