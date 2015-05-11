Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :path => 'accounts'


  # Resources should never be nested more than 1 level deep.
  #   Example of shallow nesting:
  #   resources :articles do
  #     resources :comments, only: [:index, :new, :create]
  #   end
  #   resources :comments, only: [:show, :edit, :update, :destroy]

  resources :users do
    resources :journeys do
      resources :goals
      resources :posts, only: [:new, :create, :edit, :update, :destroy] do
        resources :comments
      end
    end
  end


resources :posts, only: [:index, :show]

resources :follows

end
