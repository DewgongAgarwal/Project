Rails.application.routes.draw do
#  get 'check/index'
#    resources :set_key
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
  
  controller :set_key do
      post   '/set_key_teacher' => :teacher, as: :set_key_teacher
      post '/set_key_student' => :student, as: :set_key_student
      post 'set_key_school' => :school, as: :set_key_school
      
  end
  
  controller :checker do
      get '/checker/:id/:id2' => :index, as: :checker
    end
  
  controller :communicate do
      post '/communicate' => :index
  end
  
  controller :check do
      get'/check/:id/:id2' => :index, as: :check
      
  end
  
  controller :student_session do
      get    '/studentlogin' =>  :new
      post   '/studentlogin' => :create
      get '/studentlogout' =>  :destroy
      
  end
 
 controller :teacher_view_student_posts do
     
     post 'verified/new' => :verified, as: :verified_new
     post 'rejected/new' => :rejected, as: :rejected_new
     
end
 
 controller :school_view_student_posts do
     
     get 'verifiedss/new/:id/:id2' => :verified, as: :verifiedss_new
     get 'rejectedss/new/:id/:id2' => :rejected, as: :rejectedss_new
     
 end
 
 controller :school_view_teacher_posts do
     
     get 'verifiedst/new/:id/:id2' => :verified, as: :verifiedst_new
     get 'rejectedst/new/:id/:id2' => :rejected, as: :rejectedst_new
     
 end
 
 controller :posts do
     get    '/post/new/:id/:ids' =>  :new, as: :post_new
     
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
