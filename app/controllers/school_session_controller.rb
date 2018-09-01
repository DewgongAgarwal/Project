class SchoolSessionController < ApplicationController
    def new
    end
    
    def create
        sch_user = School.find_by(email: params[:session][:email].downcase)
        if sch_user && sch_user.authenticate(params[:session][:password])
            log_in sch_user
            redirect_to sch_user
            else
            flash.now[:warning] = "Invalid-Access Denied"
            render "new"
        end
    end
    
    def destroy
        log_out
        redirect_to sch_path
    end
end
