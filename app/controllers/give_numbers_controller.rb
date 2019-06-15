class GiveNumbersController < ApplicationController
skip_before_action :verify_authenticity_token

def give_numbers
    
    
    post_id = params[:post_id].to_i
    
    type = params[:type].to_i
    
    if type == 1
        post = Post.find(post_id).data
    elsif type == 2
        post = TeacherPost.find(post_id).data
    end
    
    point1 = PostDataTable1.where(post_id: post_id, poster_type: type)[0]
    point2 = PostDataTable2.where(post_id: post_id, poster_type: type)[0]
    point3 = PostDataTable3.where(post_id: post_id, poster_type: type)[0]
    point4 = PostDataTable4.where(post_id: post_id, poster_type: type)[0]
    point5 = PostDataTable5.where(post_id: post_id, poster_type: type)[0]
    render :json => [post, [point1.data, point1.y], [point2.data, point2.y], [point3.data, point3.y], [point4.data, point4.y], [point5.data, point5.y]]
end
    
end
