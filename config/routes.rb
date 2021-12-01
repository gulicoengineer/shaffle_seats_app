Rails.application.routes.draw do
  root "static_pages#menu"
  get 'static_pages/main', to: "static_pages#main", as:"main"
  get "static_pages/setting", to: "static_pages#setting", as: "setting"
  post "students/save_seats_order", to: "students#save_seats_order"
  resources :students
end
