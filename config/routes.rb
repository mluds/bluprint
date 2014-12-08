Rails.application.routes.draw do
  # Root
  root to: redirect('my/assignments')

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
  get 'my/students', to: 'users#view_instructor_students', as: :my_students
  get 'students', to: 'users#view_students', as: :manage_students
  get 'students/add', to: 'users#view_students_add', as: :manage_students_add
  get 'instructors', to: 'users#view_instructors', as: :manage_instructors

  post 'instructors/:i_id/:s_id', to: 'users#add_student', as: :add_student
  delete 'instructors/:i_id/:s_id', to: 'users#remove_student', as: :remove_student

  # Authorable problems
  get 'manage/problems', to: 'authorable_problems#view', as: :manage_problems
  get 'author/problems', to: 'authorable_problems#view_current_user', as: :author_problems
  get 'author/problems/new', to: 'authorable_problems#new', as: :new_auth_problem
  get 'author/problems/:id', to: 'authorable_problems#edit', as: :edit_problem

  post 'author/problems/create', to: 'authorable_problems#create', as: :create_auth_problem
  patch 'author/problems/:id', to: 'authorable_problems#update', as: :update_problem
  delete 'author/problems/:id', to: 'authorable_problems#delete', as: :delete_auth_problem

  # Problems
  get 'problems/:id', to: 'problems#edit', as: :do_problem

  # Authorable assignments
  get 'author/assignments', to: 'authorable_assignments#view_current_user', as: :author_assignments
  get 'manage/assignments', to: 'authorable_assignments#view', as: :manage_assignments
  get 'author/assignments/:id', to: 'authorable_assignments#edit', as: :edit_auth_assign
  delete 'author/assignments/:id', to: 'authorable_assignments#delete', as: :delete_auth_assign

  # Assignments
  get 'my/assignments', to: 'assignments#view_current_user', as: :my_assignments
  get 'assignments/:id', to: 'assignments#view', as: :view_assignment
  post 'assignments/:id', to: 'assignments#create', as: :create_assignments
end
