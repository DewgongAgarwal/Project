class TeacherViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    skip_before_action :verify_authenticity_token
    def show
        @student = Student.find(params[:stud_id].to_i)

    end
    
    
    def give_student_data
        
        school_id = params[:school].to_i
        student = Student.where(school: school_id)
        render :json => student
        
    end
    
    def give_post_data
       
       student_id = params[:stud_id].to_i
       if params[:type].to_i == 2
           render :json => Post.where(stud_id: student_id, category: [4,5,6,7,8])
        else
            render :json => Post.where(stud_id: student_id)
       end
    end
    
    private
    
    def set_post
        @teacher = Teacher.find(params[:id].to_i)
    end
    
end
