class StudentSessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
    end
    
    def create
        student_user = Student.find_by(email: params[:email].downcase)
        log_in student_user
        $student_islogged_in = true
        $teacher_islogged_in = false
        $school_islogged_in = false
        $logger_id = student_user.id
        redirect_to student_path(student_user.id)
        
    end
    
    def destroy
        log_out
        $student_islogged_in = false
        $teacher_islogged_in = false
        $school_islogged_in = false
        $logger_id = 0
        $comm_key = 0
        redirect_to students_path
    end
    
end
