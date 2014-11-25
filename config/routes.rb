Rails.application.routes.draw do
    
  get 'problems/edit'

  root 'home#home'
  
  get '/my/assignments' => 'assignments#view_current_user', as: :my_assignments
  
  get '/my/students' => 'users#view_current_user', as: :my_students
  get '/manage/students' => 'users#view_students', as: :manage_students
  get '/manage/instructors' => 'users#view_instructors', as: :manage_instructors
  
  get '/author/assignments' => 'authorable_assignments#view_current_user', as: :author_assignments
  get '/manage/assignments' => 'authorable_assignments#view', as: :manage_assignments
  
  get '/author/problems' => 'authorable_problems#view_current_user', as: :author_problems
  get '/manage/problems' => 'authorable_problems#view', as: :manage_problems
  
  get '/problems/:id' => 'problems#edit', as: :do_problem
  
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
  
end
