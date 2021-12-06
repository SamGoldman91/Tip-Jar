class TipsController < ApplicationController
  def index
    matching_tips = Tip.all

    @list_of_tips = matching_tips.order({ :created_at => :desc })

    render({ :template => "tips/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tips = Tip.where({ :id => the_id })

    @the_tip = matching_tips.at(0)

    render({ :template => "tips/show.html.erb" })
  end

  def create
    the_tip = Tip.new
    the_tip.tip_text = params.fetch("query_tip_text")
    the_tip.tip_pic = params.fetch("query_tip_pic")
    the_tip.user_id = session.fetch(:user_id)
    the_tip.business_id = params.fetch("query_business_id")
    the_tip.tip_type = params.fetch("query_tip_type")
    the_tip.upvote_count = params.fetch("query_upvote_count")
    the_tip.downvote_count = params.fetch("query_downvote_count")

    if the_tip.valid?
      the_tip.save
      redirect_to("/tips", { :notice => "Tip created successfully." })
    else
      redirect_to("/tips", { :notice => "Tip failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tip = Tip.where({ :id => the_id }).at(0)

    the_tip.tip_text = params.fetch("query_tip_text")
    the_tip.tip_pic = params.fetch("query_tip_pic")
    the_tip.user_id = params.fetch("query_user_id")
    the_tip.business_id = params.fetch("query_business_id")
    the_tip.tip_type = params.fetch("query_tip_type")
    the_tip.upvote_count = params.fetch("query_upvote_count")
    the_tip.downvote_count = params.fetch("query_downvote_count")

    if the_tip.valid?
      the_tip.save
      redirect_to("/tips/#{the_tip.id}", { :notice => "Tip updated successfully."} )
    else
      redirect_to("/tips/#{the_tip.id}", { :alert => "Tip failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tip = Tip.where({ :id => the_id }).at(0)

    the_tip.destroy

    redirect_to("/tips", { :notice => "Tip deleted successfully."} )
  end
end
