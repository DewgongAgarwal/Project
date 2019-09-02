class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
#  respond_to :html, :js

  # GET /teachers
  # GET /teachers.json
  def index
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
      @students = Student.where(school: @teacher.school)
  end

  def public_key
      render :json => Teacher.find(params[:id].to_i)
  end
  
  def public_key_by_email
      render :json => Teacher.find_by(email: params[:email]).keys
    end
  
  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @school = School.all
  end


  # POST /teachers
  # POST /teachers.json
  def create
      teacher = Teacher.new()
      teacher.email = params[:email]
      teacher.firstname = params[:firstname]
      teacher.lastname = params[:lastname]
      teacher.school = params[:school]
      teacher.keys = params[:keys]
      stud = Student.where(email: teacher.email)
      teach = Teacher.where(email: teacher.email)
      sch = School.where(email: teacher.email)
      
      if stud.length == 0 and teach.length == 0 && sch.length == 0
          teacher.save
          redirect_to teachers_path
          
          else
          redirect_to teachers_path, notice: 'User Exists'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

end
