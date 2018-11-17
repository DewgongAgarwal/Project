class AccountExistsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        person = []
        if params[:type].to_i == 1
            person = Student.where(keys: params[:keys])
        end
        if params[:type].to_i == 2
            person = Teacher.where(keys: params[:keys])
        end
        if params[:type].to_i == 3
            person = School.where(keys: params[:keys])
        end
    if person.length == 0
        render :json => false
    else
        render :json => true
    end
        
    end

end
