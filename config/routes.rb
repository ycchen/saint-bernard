Rails.application.routes.draw do
  resources :patients, only: :index do
    collection do
      get :list
    end
    member do
      get :transfer
    end
  end
  root to: 'patients#index'
end
