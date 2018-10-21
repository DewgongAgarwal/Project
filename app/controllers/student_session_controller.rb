class StudentSessionController < ApplicationController
    def new
    end
    
    def create
        student_user = Student.find_by(email: params[:session][:email].downcase)
        if student_user && student_user.authenticate(params[:session][:password])
            log_in student_user
            $student_islogged_in = true
            $teacher_islogged_in = false
            $school_islogged_in = false
            $logger_id = student_user.id
            redirect_to student_user
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
        redirect_to students_path
    end
    
end
