class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  skip_before_action :verify_authenticity_token
  # GET /students
  # GET /students.json
  def index
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  def public_key
      render :json=> Student.find(params[:id].to_i)
    end
  
  # GET /students/new
  def new
    @student = Student.new
    @school = School.all
  end
  
  

  # POST /students
  # POST /students.json
  def create
    student = Student.new()
    student.email = params[:email]
    student.firstname = params[:firstname]
    student.lastname = params[:lastname]
    student.school = params[:school]
    student.keys = params[:keys]
    stud = Student.where(email: student.email)
    teach = Teacher.where(email: student.email)
    sch = School.where(email: student.email)
    if stud.length == 0 and teach.length == 0 && sch.length == 0
        student.save
        redirect_to students_path
        
        else
        redirect_to students_path, notice: 'User Exists'
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
end
