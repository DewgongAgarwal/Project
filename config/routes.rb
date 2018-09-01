Rails.application.routes.draw do
  
  resources :samples
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
