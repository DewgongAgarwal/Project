class SetKeyController < ApplicationController
    skip_before_action :verify_authenticity_token
  def index
      teacher = Teacher.find(params[:id])
      teacher.keys = params[:Key]
      teacher.save
  end
end
