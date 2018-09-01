class Teacher < ApplicationRecord
  has_secure_password
  belongs_to :school
end
