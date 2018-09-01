class TeacherSessionController < ApplicationController
    def new
    end
    
    def create
        teacher_user = Teacher.find_by(email: params[:session][:email].downcase)
        if teacher_user && teacher_user.authenticate(params[:session][:password])
            log_in teacher_user
            redirect_to teacher_user
            else
            flash.now[:warning] = "Invalid-Access Denied"
            render "new"
        end
    end
    
    def destroy
        log_out
        redirect_to teachers_path
    end
end
