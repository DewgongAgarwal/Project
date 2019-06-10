class SchoolViewTeacherPostsController < ApplicationController
    before_action :set_post, only: [:show]
    skip_before_action :verify_authenticity_token
    def show
        @teacher = Teacher.find(params[:teacher_id].to_i)
    end
    
    def give_teacher_data
        
        school_id = params[:school].to_i
        teacher = Teacher.where(school: school_id)
        render :json => teacher

        
    end
    
    def give_teacher_post_data
        
        teacher_id = params[:teacher_id].to_i
        render :json => TeacherPost.where(teacher_id: teacher_id, category: [1,2])

    end
    
    def set_post
        @school = School.find(params[:id])
    end

end
