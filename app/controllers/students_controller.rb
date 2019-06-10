class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /students
  # GET /students.json
  def index
      $student_islogged_in = false
      $teacher_islogged_in = false
      $school_islogged_in = false
      $logger_id = 0
  end

  # GET /students/1
  # GET /students/1.json
  def show
      if $student_islogged_in and not $teacher_islogged_in and not $school_islogged_in and $logger_id == @student.id
         else
         redirect_to studentlogin_url
        end
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
            if student.save
                $student_islogged_in = true
                $teacher_islogged_in = false
                $school_islogged_in = false
                $logger_id = student.id
                redirect_to student, notice: 'Student was successfully created.'
            else
                redirect_to students_path
            end
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
