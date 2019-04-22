Rails.application.routes.draw do
  root "employees#index"
  resources :employees do
    get :create_csv, on: :collection
  end
end
