Rails.application.routes.draw do
  
  get 'todos/:id/complete', to:'todos#complete', as: 'todos_complete'
  get 'todos/list', to: 'todos#list', as: 'list_todos'
  get 'todos', to: 'todos#index'
  post 'todos', to: 'todos#create'
  get 'todos/new', to: 'todos#new', as: 'new_todo'
  get 'todos/:id/edit', to: 'todos#edit', as: 'edit_todo'
  get 'todos/:id', to: 'todos#show', as:'todo'
  patch 'todos/:id', to:'todos#update'
  delete 'todos/:id', to: 'todos#destroy'
  root 'todos#index'
end
