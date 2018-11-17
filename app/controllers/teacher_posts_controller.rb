class TeacherPostsController < ApplicationController
    before_action :set_teacher_post, only: [:show, :new]
    skip_before_action :verify_authenticity_token, only: [:set_id, :create]

  def show
      
       if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id.to_i
              @categories = Category.where(id: [1, 2])
              @profile = Profile.all
              
              else
              redirect_to teacherlogin_url
       end
  end

  # GET /teacher_posts/new
  def new
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
            @category_id = params[:ids]
            if @category_id == "1"
                @type = nil
                @subcategory = nil
                else
                    @type = nil
                    @subcategory = Profile.all
                end
            @teacher_post = TeacherPost.new
            
            else
            redirect_to teacherlogin_url
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
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == post.teacher_id
          check_post = TeacherPost.where(teacher_id: post.teacher_id, category: post.category, subcategory: post.subcategory, status: [2,3,4])
          respond_to do |format|
              if check_post.length == 0 and post.save
                  format.html { redirect_to teacher_post_path(session[:user_id]), notice: 'Post was successfully created.' }
                  
                  else
                  format.html { redirect_to teacher_post_path(session[:user_id]), notice: 'Similar Post Exists'}
              end
          end
          else
            redirect_to teacherlogin_url
      end
      
    
  end

  # PATCH/PUT /teacher_posts/1
  # PATCH/PUT /teacher_posts/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_post
        @teacher = Teacher.where(id: params[:id]).first
    end

end
