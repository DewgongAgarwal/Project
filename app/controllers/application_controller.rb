class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include StudentSessionHelper
    include TeacherSessionHelper
    $logger_id = 0
    $student_islogged_in = false
    $teacher_islogged_in = false
    $school_islogged_in = false
    $id = 0
end
