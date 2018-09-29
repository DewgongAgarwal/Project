Rails.application.routes.draw do
    resources :school_view_teacher_posts
    resources :school_view_student_posts
    resources :teacher_posts, :except => [:new]
resources :teacher_view_student_posts
resources :posts, :except => [:new]
  resources :schools
  resources :teachers
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  controller :student_session do
      get    '/studentlogin' =>  :new
      post   '/studentlogin' => :create
      get '/studentlogout' =>  :destroy
      
  end
 
 controller :posts do
     get    '/post/new/:ids' =>  :new, as: :post_new
     
 end
 
 controller :teacher_posts do
     get    '/teacher_post/new/:ids' =>  :new, as: :teacher_post_new
     
 end
 
 controller :teacher_session do
      get    '/teacherlogin' => :new
      post   '/teacherlogin' => :create
      get '/teacherlogout' => :destroy
    
  end
  
  
  controller :school_session do
      get    '/schoollogin' => :new
      post   '/schoollogin' => :create
      get '/schoollogout' => :destroy
    
  end

end
