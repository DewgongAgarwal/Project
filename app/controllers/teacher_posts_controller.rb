class TeacherPostsController < ApplicationController
    before_action :set_teacher_post, only: [:show, :edit, :update, :destroy, :new, :create]

  # GET /teacher_posts
  # GET /teacher_posts.json
#  def index
#    @teacher_posts = TeacherPost.all
#  end

  # GET /teacher_posts/1
  # GET /teacher_posts/1.json
  def show
      
       if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher_post.id
              @categories = Category.where(id: [1, 2])
              @profile = Profile.all
              
              else
              redirect_to teacherlogin_url
       end
  end

  # GET /teacher_posts/new
  def new
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher_post.id
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

  # GET /teacher_posts/1/edit

  # POST /teacher_posts
  # POST /teacher_posts.json
  def create
      if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher_post.id
      
            @teacher_post = TeacherPost.new(teacher_post_params)
            check_post = TeacherPost.where(stud_id: @teacher_post.teacher_id, category: @teacher_post.category, subcategory: @teacher_post.subcategory, types1: @teacher_post.types1, status: [2,3,4])
            respond_to do |format|
              if @teacher_post.save
                format.html { redirect_to @teacher_post, notice: 'Teacher post was successfully created.' }
                format.json { render :show, status: :created, location: @teacher_post }
              else
                format.html { render :new }
                format.json { render json: @teacher_post.errors, status: :unprocessable_entity }
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
        @teacher_post = TeacherPost.where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_post_params
        params.require(:teacher_post).permit(:teacher_id, :data, :subcategory, :status, :category)
    end
end
