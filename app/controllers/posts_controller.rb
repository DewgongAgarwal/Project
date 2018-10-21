class PostsController < ApplicationController
    before_action :set_post, only: [:show, :new, :create]
#  before_action :set_category, only: [:new]
  # GET /posts
  # GET /posts.json
#  def index
#    @posts = Post.all
#  end

  # GET /posts/1
  # GET /posts/1.json
  def show
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @stud.id
          @categories = Category.all
          @profile = Profile.all
          @family = Family.all
          @education = Education.all
          @testing = Testing.all
          @activities = Activity.all
          @type = Type.all
          @testing_type = TType.all
          @activity_type = AType.all
          @other = Post.where(stud_id: @stud, Category: 8)
        else
            redirect_to studentlogin_url
      end

  end

  # GET /posts/new
  def new
      
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @stud.id
              @category_id = params[:ids]
              if @category_id == "1"
                  @type = nil
                  @subcategory = nil
                elsif @category_id == "2"
                    @type = nil
                    @subcategory = Profile.all
                elsif @category_id == "3"
                    @type = Type.all
                    @subcategory =  Family.all
                elsif @category_id == "4"
                    @type = nil
                    @subcategory = Education.all
                elsif @category_id == "5"
                    @type = TType.all
                    @subcategory = Testing.all
                elsif @category_id == "6"
                    @type = AType.all
                    @subcategory = Activity.all
                elsif @category_id == "7"
                    @type = nil
                    @subcategory = nil
                else
                    @type = nil
                    @subcategory = nil
            end
            @post = Post.new
    
    else
    redirect_to studentlogin_url
  end
    
  end

  # GET /posts/1/edit

  # POST /posts
  # POST /posts.json
  def create
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @stud.id
        @post = Post.new(post_params)
        check_post = Post.where(stud_id: @post.stud_id, category: @post.category, subcategory: @post.subcategory, types1: @post.types1, status: [2,3,4])
        respond_to do |format|
          if check_post.length == 0 and @post.save
              format.html { redirect_to post_path(session[:user_id]), notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
          format.html { redirect_to post_path(session[:user_id]), notice: 'Similar Post Exists'}
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    else
        redirect_to studentlogin_url
    end
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json

  # DELETE /posts/1
  # DELETE /posts/1.json


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @stud = Student.where(id: params[:id]).first
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:post).permit(:stud_id, :category, :subcategory, :types1, :data, :status)
    end
end
