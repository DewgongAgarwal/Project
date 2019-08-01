Rails.application.routes.draw do
 
  root to: 'home#index'
  
  resources :schools, :only => [:index]
  controller :schools do
      post '/show_school' => :show
  end
  
  resources :teachers, :except => [:edit, :update, :destroy, :show]
  controller :teachers do
      post '/show_teacher' => :show
  end
  
  resources :students, :except => [:edit, :update, :destroy, :show]
  controller :students do
      post '/show_student' => :show
    end
  
  controller :login_token do
      post '/send_login_token' => :give_login_token
      get '/login_token/:type/:id/:token' => :check_login_token, as: :check_login_token
    end
  
  controller :give_numbers do
      post '/give_numbers' => :give_numbers
  end

  
  controller :communicate do
      post '/communicate' => :index
  end
  
  controller :students do
      post 'give_student_public_key' => :public_key, as: :student_public_key
  end
  controller :teachers do
      post 'give_teacher_public_key' => :public_key, as: :teacher_public_key
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
     post '/my_posts_student' => :show, as: :post_show
     post '/post/new' =>  :new, as: :post_new
     post '/give_subcat_posts' => :give_subcategory, as: :give_subcat
     post '/give_previous_posts' => :give_previous, as: :give_previous
     post '/give_categories' => :give_categories, as: :give_categories
     post '/give_previous_posts_bysub' => :give_previous_bysub, as: :give_previous_bysub
     
 end
 resources :posts, :only => [:create]

 controller :teacher_posts do
     post '/my_posts_teacher' => :show, as: :teacher_post_show
     post '/teacher_post/new' =>  :new, as: :teacher_post_new
     post '/give_subcat_teacher_posts' => :give_subcategory, as: :give_teacher_subcat
     post '/give_teacher_posts_bysub' => :give_previous_bysub, as: :give_previous_teacher_bysub
 end
 resources :teacher_posts, :only => [:create]
 
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
  
  controller :teacher_view_student_posts do
    
    post '/give_post_data' => :give_post_data, as: :give_post_data
    post '/give_student_data' => :give_student_data, as: :give_student_data
    post '/show_student_posts_teacher' => :show, as: :show_student_posts
    end
  
  controller :school_view_student_posts do
      
      post '/show_student_posts_school' => :show, as: :show_s_to_s_posts
  end
  
  controller :school_view_teacher_posts do
      post '/give_teacher_data' => :give_teacher_data, as: :give_teacher_data
      post '/give_teacher_post_data' => :give_teacher_post_data, as: :give_teacher_post_data
      post '/show_teacher_posts' => :show, as: :show_teacher_posts
    end

end
