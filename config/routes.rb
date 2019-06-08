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

  controller :login_token do
      post '/send_login_token' => :give_login_token
      get '/login_token/:type/:id/:token' => :check_login_token, as: :check_login_token
    end
  
  controller :give_numbers do
      post '/give_numbers' => :give_numbers
  end
      
  controller :set_key do
      post   '/set_key_teacher' => :teacher, as: :set_key_teacher
      post '/set_key_student' => :student, as: :set_key_student
      post 'set_key_school' => :school, as: :set_key_school
      
  end
  
  controller :checker do
      get '/checker/:id/:id2/:id3/:id4' => :index, as: :checker
    end
  
  controller :communicate do
      post '/communicate' => :index
  end
  
  controller :check do
      get'/check/:id/:id2/:id3' => :index, as: :check
      
  end
  
  controller :student_session do
      get    '/studentlogin' =>  :new
      post   '/studentlogin' => :create
      get '/studentlogout' =>  :destroy
      
  end
 
 controller :verify_and_reject do
     
     post '/signed' => :signed
     
end
 
 controller :posts do
     get    '/post/new/:id' =>  :new, as: :post_new
     post '/give_subcat_posts' => :give_subcategory, as: :give_subcat
     post '/give_previous_posts' => :give_previous, as: :give_previous
     post '/give_categories' => :give_categories, as: :give_categories
     post '/give_previous_posts_bysub' => :give_previous_bysub, as: :give_previous_bysub
     
 end
 
 controller :teacher_posts do
     get    '/teacher_post/new/:id/:ids' =>  :new, as: :teacher_post_new
     
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
