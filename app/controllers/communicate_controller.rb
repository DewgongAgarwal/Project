
class CommunicateController < ApplicationController
    skip_before_action :verify_authenticity_token
 
  def index
      
      person = Student.where(email: params[:username])
      
      if params[:type].to_i == 2
          person = Teacher.where(email: params[:username])
          elsif params[:type].to_i == 3
          person = School.where(email: params[:username])
        end
      
      if person.length == 0
          render :json => "error"
          puts("error")
    
    else
        public_key = person[0].keys
        commkey = SecureRandom.hex(27)
        commkey_padded = commkey[0 .. 31] + "1001001001" + commkey[32 .. 63]
        r = SecureRandom.hex(32)
        g = (Digest::SHA256.hexdigest r).to_i(16)
        x = (g^commkey_padded.to_i(16)).to_s(16)
        h = Digest::SHA256.hexdigest x
        y = ((r.to_i(16))^(h.to_i(16))).to_s(16)
        padded_message = x + "" + y
        encrypted = (padded_message.to_i(16) ** 3) % public_key.to_i
        $comm_key = commkey
#        padded_message = padded_message.to_i(16)
        render :json => encrypted
    end
      
  end
end
