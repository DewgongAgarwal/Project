class TeacherViewStudentPostsController < ApplicationController
    before_action :set_post, only: [:show]
    skip_before_action :verify_authenticity_token, only: [:verified, :rejected]
    def show
        if not $student_islogged_in and $teacher_islogged_in and not $school_islogged_in and $logger_id == @teacher.id
            @students = Student.where(school: @teacher.school)
            @status = Status.all
        else
        redirect_to teacherlogin_url
        end
        
    end
    
    def set_post
        @teacher = Teacher.find(params[:id])
    end
    
end
