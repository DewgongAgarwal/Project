class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
      
      if not $student_islogged_in and not $teacher_islogged_in and $school_islogged_in and $logger_id == @school.id
          
          @students = Student.where(school: @school.id)
          @teachers = Teacher.where(school: @school.id)
          
          
          else
          redirect_to schoollogin_url
      end
      
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

end
