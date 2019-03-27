class LoginTokenController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def give_login_token()
        
        type = params[:type].to_i
        
        if type == 1
            user = Student.find_by_email(params[:email])
        elsif type == 2
            user = Teacher.find_by_email(params[:email])
        else
            user = School.find_by_email(params[:email])
        end
        
        
        user.send_token() if user
        
       
    end
    
    
    def check_login_token()
        
       
       @type = params[:type].to_i
       
       if @type == 1
           user = Student.find(params[:id].to_i)
           elsif @type == 2
           user = Teacher.find(params[:id].to_i)
           else
           user = School.find(params[:id].to_i)
       end
       
       if user
           
           
           if user.token == params[:token] and user.timestamp >= 10.minutes.ago
               user.timestamp = 11.minutes.ago
               user.save
               @user = user
               
            else
                redirect_to root_path
           
        end
        
    end
       end
    
    
end
