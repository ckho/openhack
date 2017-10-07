Rails.application.routes.draw do
  resources :companies do
	resources :job_posts
  end

  patch 'companies/:id/vote', to: 'companies#vote', as: 'vote'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # root 'home#index'

	root 'job_posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
