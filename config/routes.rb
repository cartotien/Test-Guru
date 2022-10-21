Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root "tests#index"

  resources :users, only: :create
  resources :sessions, only: :create
  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

  resources :tests do

    member do
      post :start
      get :start, to: 'test_passages#start'
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist, to: 'gists#create'
    end
  end

  namespace :admin do
    root "tests#index"
    resources :gists
    resources :badges

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
