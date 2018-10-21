class TeacherSessionController < ApplicationController
    def new
    end
    
    def create
        teacher_user = Teacher.find_by(email: params[:session][:email].downcase)
        if teacher_user && teacher_user.authenticate(params[:session][:password])
            log_in teacher_user
            $student_islogged_in = false
            $teacher_islogged_in = true
            $school_islogged_in = false
            $logger_id = teacher_user.id
            redirect_to teacher_user
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
        redirect_to teachers_path
    end
end
