class TeacherPostsController < ApplicationController
    before_action :set_teacher_post, only: [:show, :new, :give_previous_bysub]
    skip_before_action :verify_authenticity_token, only: [:set_id, :create,:give_previous_bysub,:give_subcategory]

  def show
      
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
        @categories = Category.where(id: [1, 2])
        @profile = Profile.all
        
        
        
        
        else
            redirect_to root_path
    end

  end

  # GET /teacher_posts/new
  def new
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
        @category = Category.where(id:[1,2])
        account_post = TeacherPost.where(teacher_id: @teacher_id, category: 1, status: 3)
        if account_post.length != 1
            @category = Category.where(id: 1)
        end
        
        
        @teacher_post = TeacherPost.new
        
        else
        redirect_to root_path
        
    end
  
  end


  def create
      post = TeacherPost.new()
      post.teacher_id = params[:teacher_id]
      post.category = params[:category]
      post.subcategory = params[:subcategory]
      post.data = params[:data]
      post.postkey = params[:postkey]
      post.status = params[:status]
      post.teacherSign = params[:teacherSign]
      
      check_post = TeacherPost.where(teacher_id: post.teacher_id, category: post.category, subcategory: post.subcategory, status: [2,3,4])
      respond_to do |format|
          if check_post.length == 0 and post.save
              
              data1 = PostDataTable1.new()
              data2 = PostDataTable2.new()
              data3 = PostDataTable3.new()
              data4 = PostDataTable4.new()
              data5 = PostDataTable5.new()
              
              poster_type = 2
              post_id = post.id
              data1.data = params[:data1]
              data2.data = params[:data2]
              data3.data = params[:data3]
              data4.data = params[:data4]
              data5.data = params[:data5]
              
              data1.post_id = data2.post_id = data3.post_id = data4.post_id = data5.post_id = post_id
              data1.poster_type = data2.poster_type = data3.poster_type = data4.poster_type = data5.poster_type = poster_type
              
              data1.save
              data2.save
              data3.save
              data4.save
              data5.save
              
              
              format.html { redirect_to teacher_post_path(session[:user_id]), notice: 'Post was successfully created.' }
              
              else
              format.html { redirect_to teacher_post_path(session[:user_id]), notice: 'Similar Post Exists'}
          end
      end
         
    
  end
  
  
  def give_subcategory()
      
      cat_id = params[:id].to_i
      
      if cat_id == 1
          subcategory = nil
        elsif cat_id == 2
          subcategory = Profile.all
        end
      subs = Array.new
      subs_id = Array.new
      if subcategory
          
          
          subcategory.each do |sub|
              subs_id.insert(-1, sub.id)
              subs.insert(-1, sub.name)
          end
      end
      
      render :json => {subs1:subs, subs_id1:subs_id}
  end
  
  
  def give_previous_bysub()
      
      render :json => TeacherPost.where(teacher_id: @teacher.id, category: params[:l1].to_i, subcategory: params[:l2])
      
  end
  


  # PATCH/PUT /teacher_posts/1
  # PATCH/PUT /teacher_posts/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_post
        @teacher = Teacher.find(params[:id].to_i)
    end

end
