class StudentSessionController < ApplicationController
    def new
    end
    
    def create
        student_user = Student.find_by(email: params[:session][:email].downcase)
        if student_user && student_user.authenticate(params[:session][:password])
            log_in student_user
            redirect_to student_user
            else
            flash.now[:warning] = "Invalid-Access Denied"
            render "new"
        end
    end
    
    def destroy
        log_out
        redirect_to students_path
    end
    
end
