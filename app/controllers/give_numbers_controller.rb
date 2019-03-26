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
    
    data1 = PostDataTable1.where(post_id: post_id, poster_type: type)[0].data
    data2 = PostDataTable2.where(post_id: post_id, poster_type: type)[0].data
    data3 = PostDataTable3.where(post_id: post_id, poster_type: type)[0].data
    data4 = PostDataTable4.where(post_id: post_id, poster_type: type)[0].data
    data5 = PostDataTable5.where(post_id: post_id, poster_type: type)[0].data

    puts([post, data1, data2, data3, data4, data5])
    render :json => [post, data1, data2, data3, data4, data5]
end
    
end
