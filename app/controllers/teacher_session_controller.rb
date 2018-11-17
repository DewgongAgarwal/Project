class TeacherSessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
    end
    
    def create
        teacher_user = Teacher.find_by(email: params[:email].downcase)
        log_in teacher_user
        $student_islogged_in = false
        $teacher_islogged_in = true
        $school_islogged_in = false
        $logger_id = teacher_user.id
        redirect_to teacher_user
    end
    
    def destroy
        log_out
        $student_islogged_in = false
        $teacher_islogged_in = false
        $school_islogged_in = false
        $logger_id = 0
        $comm_key = 0
        redirect_to teachers_path
    end
end
