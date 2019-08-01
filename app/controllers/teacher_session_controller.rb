class TeacherSessionController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
    end
    
    def create
        teacher_user = Teacher.find_by(email: params[:email].downcase)
    end
    
    def destroy
        $comm_key = 0
        redirect_to teachers_path
    end
end
