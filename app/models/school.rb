class School < ApplicationRecord
  has_secure_password
  has_many :teachers
  has_many :students
end
