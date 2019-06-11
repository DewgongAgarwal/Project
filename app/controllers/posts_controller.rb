class PostsController < ApplicationController
    before_action :set_post, only: [:show, :new, :give_previous, :give_previous_bysub]
    skip_before_action :verify_authenticity_token, only: [:set_id, :create, :give_subcategory, :give_previous, :give_categories, :give_previous_bysub]

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
      @category = Category.all
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @stud.id
          
          account_post = Post.where(stud_id: @stud_id, category: 1, status: 3)
          if account_post.length != 1
              @category = Category.where(id: 1)
            end
        @post = Post.new
    
    else
    redirect_to studentlogin_url
  end
    
  end

  def create
      
        post = Post.new()
        post.stud_id = params[:stud_id]
        post.category = params[:category]
        post.subcategory = params[:subcategory]
        post.types1 = params[:types1]
        post.data = params[:data]
        post.postkey = params[:postkey]
        post.status = params[:status]
        post.studentSign = params[:studentSign]
        
        
    if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == post.stud_id
        check_post = Post.where(stud_id: post.stud_id, category: post.category, subcategory: post.subcategory, types1: post.types1, status: [2,3,4])
        respond_to do |format|
          if check_post.length == 0 and post.save
              
              data1 = PostDataTable1.new()
              data2 = PostDataTable2.new()
              data3 = PostDataTable3.new()
              data4 = PostDataTable4.new()
              data5 = PostDataTable5.new()
              
              poster_type = 1
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
              
              format.html { redirect_to post_path(session[:user_id]), notice: 'Post was successfully created.' }
          else
          format.html { redirect_to post_path(session[:user_id]), notice: 'Similar Post Exists'}
          
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
  def give_subcategory()
      
      cat_id = params[:id].to_i
    
      if cat_id == 1
          type = nil
          subcategory = nil
          elsif cat_id == 2
          type = nil
          subcategory = Profile.all
          elsif cat_id == 3
          type = Type.all
          subcategory =  Family.all
          elsif cat_id == 4
          type = nil
          subcategory = Education.all
          elsif cat_id == 5
          type = TType.all
          subcategory = Testing.all
          elsif cat_id == 6
          type = AType.all
          subcategory = Activity.all
          elsif cat_id == 7
          type = nil
          subcategory = nil
          else
          type = nil
          subcategory = nil
      end
      subs = Array.new
      subs_id = Array.new
      if subcategory
          
        
          subcategory.each do |sub|
              subs_id.insert(-1, sub.id)
              subs.insert(-1, sub.name)
        end
        end
          types = Array.new
          type_id = Array.new
      if type
          
          
          type.each do |type|
              type_id.insert(-1, type.id)
              types.insert(-1, type.name)
          end
        
        end
      
      render :json => {subs1:subs, types1:types ,subs_id1:subs_id, types_id1:type_id}
  end

  
  def give_previous()
   render :json => Post.where(stud_id: @stud.id, category: params[:l1].to_i, types1: params[:l2])
   
end
  
  
  def give_previous_bysub()

      render :json => Post.where(stud_id: @stud.id, category: params[:l1].to_i, types1: params[:l2], subcategory: params[:l3])

end
  
  
  
    def give_categories()
        render :json => Category.all
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @stud = Student.where(id: params[:id].to_i).first
    end
    
    
    
    

end
