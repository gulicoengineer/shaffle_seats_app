Rails.application.routes.draw do
  root 'static_pages#main'
  get 'students/new'
  resources :students
end
