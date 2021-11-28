Rails.application.routes.draw do
  root "static_pages#menu"
  get 'static_pages/main', to: "static_pages#main", as:"main"
  get "static_pages/setting", to: "static_pages#setting", as: "setting"
  resources :students
end
