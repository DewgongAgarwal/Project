class UserMailer < ApplicationMailer
    
    default from: 'from@example.com'
    layout 'mailer'
    
    def give_login_token(user, type)
        
       @user = user
       @type = type
       mail to: user.email, subject: "Login Token"
        
    end
    
end
