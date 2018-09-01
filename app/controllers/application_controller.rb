class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include StudentSessionHelper
    include TeacherSessionHelper
end
