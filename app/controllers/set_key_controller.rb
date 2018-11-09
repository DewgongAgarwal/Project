class SetKeyController < ApplicationController
    skip_before_action :verify_authenticity_token
    def student
        student = Student.find(params[:id])
        student.keys = params[:Key]
        student.save
    end
  
  def teacher
      teacher = Teacher.find(params[:id])
      teacher.keys = params[:Key]
      teacher.save
  end
  
  def school
      school = School.find(params[:id])
      school.keys = params[:Key]
      school.save
  end
  
end
