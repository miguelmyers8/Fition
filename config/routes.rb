Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations',  sessions: "my_sessions" }

  resources :photos do
    resources :comments
  end

  root 'photos#index'

  resources :posts do
    collection do
      get 'file_upload'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
