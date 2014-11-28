Rails.application.routes.draw do
  # Root
  root 'home#home'
  
  # Devise users
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_up: 'register',
      sign_out: 'logout',
      edit: 'my/account'
    },
    controllers: {
      registrations: 'users/registrations'
    }
  
  #Users
  get '/my/students'        => 'users#view_current_user', as: :my_students
  get '/manage/students'    => 'users#view_students',     as: :manage_students
  get '/manage/instructors' => 'users#view_instructors',  as: :manage_instructors
  
  # Authorable problems
  get   '/manage/problems'        => 'authorable_problems#view',   as: :manage_problems
  get   '/author/problems'        => 'authorable_problems#view_current_user', as: :author_problems
  get   '/author/problems/new'    => 'authorable_problems#new',    as: :new_auth_problem
  post  '/author/problems/create' => 'authorable_problems#create', as: :create_auth_problem
  get   '/author/problems/:id'    => 'authorable_problems#edit',   as: :edit_problem
  patch '/author/problems/:id'    => 'authorable_problems#update', as: :update_problem
  delete '/author/problems/:id'   => 'authorable_problems#delete', as: :delete_auth_problem
  
  # Problems
  get '/problems/:id' => 'problems#edit', as: :do_problem
  
  # Authorable assignments
  get '/author/assignments' => 'authorable_assignments#view_current_user', as: :author_assignments
  get '/manage/assignments' => 'authorable_assignments#view',              as: :manage_assignments
  
  # Assignments
  get '/my/assignments' => 'assignments#view_current_user', as: :my_assignments
end
