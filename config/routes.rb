Rails.application.routes.draw do
  resources :guarantees do
    collection do
      get 'search'
    end
  end
  devise_for :users
  root 'guarantees#index'
end
