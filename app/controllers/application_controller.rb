class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    $comm_key = 0
end
