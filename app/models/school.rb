class School < ApplicationRecord
  
  def send_token
      generate_token(:token)
      self.timestamp = Time.zone.now
      save!
      UserMailer.give_login_token(self, 3).deliver
  end
  def generate_token(column)
      begin
          self[column] = SecureRandom.urlsafe_base64
      end while School.exists?(column => self[column])
  end
  
end
