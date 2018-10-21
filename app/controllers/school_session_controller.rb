class SchoolSessionController < ApplicationController
    def new
    end
    
    def create
        sch_user = School.find_by(email: params[:session][:email].downcase)
        if sch_user && sch_user.authenticate(params[:session][:password])
            log_in sch_user
            $student_islogged_in = false
            $teacher_islogged_in = false
            $school_islogged_in = true
            $logger_id = sch_user.id
            redirect_to sch_user
            else
            flash.now[:warning] = "Invalid-Access Denied"
            render "new"
        end
    end
    
    def destroy
        log_out
        $student_islogged_in = false
        $teacher_islogged_in = false
        $school_islogged_in = false
        $logger_id = 0
        redirect_to schools_path
    end
end
