class SchoolSessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
    end
    
    def create
        sch_user = School.find_by(email: params[:email].downcase)
        log_in sch_user
        $student_islogged_in = false
        $teacher_islogged_in = false
        $school_islogged_in = true
        $logger_id = sch_user.id
        
    end
    
    def destroy
        log_out
        $student_islogged_in = false
        $teacher_islogged_in = false
        $school_islogged_in = false
        $logger_id = 0
        $comm_key = 0
        redirect_to schools_path
    end
end
