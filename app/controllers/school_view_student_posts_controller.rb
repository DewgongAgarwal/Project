class SchoolViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    def show
        if not $student_islogged_in and not $teacher_islogged_in and $school_islogged_in and $logger_id.to_i == params[:id].to_i
        
            @students = Student.where(school: @school.id)
            @status = Status.all
            
            else
            redirect_to schoollogin_url
            
        end
    end
    
    def set_post
        @school = School.find(params[:id])
    end
end
