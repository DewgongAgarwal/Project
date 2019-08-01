class StudentSessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def new
    end
    
    def create
        student_user = Student.find_by(email: params[:email].downcase)
    end
    
    def destroy
        $comm_key = 0
        redirect_to students_path
    end
    
end
