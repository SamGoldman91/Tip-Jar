class UserActivitiesController < ApplicationController
  
  def show_activity
    #Pulling tips related to a particular user
    @tips_for_user = Tip.where({ :user_id => @current_user }).order({ :created_at => :desc })

    #Pulling votes related to a particular user
    @votes_for_user = Vote.where({ :user_id => @current_user }).order({ :created_at => :desc })

    #Relating a vote to the business name
    #the_tip = Tip.all.where({ :id => a_vote.tip_id })
    #the_business = the_tip.business_id

    render({ :template => "user_activities/show.html.erb" })
  end

end