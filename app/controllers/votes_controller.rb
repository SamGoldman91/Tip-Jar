class VotesController < ApplicationController
  
  def vote_counter
    upvotes = Vote.where({ :vote_type => 1 }).count

    downvotes = Vote.where({ :vote_type => 1 }).count
    
    @net_votes = upvotes - downvotes

  end
  
  ### MOVE THIS TO A USER ACTIVITY CONTROLLER ###
  def show_activity

    #Pulling tips related to a particular user
    @tips_for_user = Tip.where({ :user_id => @current_user }).order({ :created_at => :desc })

    #Pulling votes related to a particular user
    @votes_for_user = Vote.where({ :user_id => @current_user }).order({ :created_at => :desc })

    render({ :template => "activities/show.html.erb" })
  end

  def index
    matching_votes = Vote.all

    @list_of_votes = matching_votes.order({ :created_at => :desc })

    render({ :template => "votes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_votes = Vote.where({ :id => the_id })

    @the_vote = matching_votes.at(0)

    render({ :template => "votes/show.html.erb" })
  end

  def create
    the_vote = Vote.new
    the_vote.vote_type = params.fetch("query_vote_type", false)
    the_vote.tip_id = params.fetch("query_tip_id")
    the_vote.user_id = session.fetch(:user_id)

    # Updating the vote counts whenever a vote is made
    the_tip = Tip.where({ :id => the_vote.tip_id }).at(0)
    the_tip.upvote_count = Vote.where({ :tip_id => the_tip.id }).where({ :vote_type => true }).count+1
    the_tip.downvote_count = Vote.where({ :tip_id => the_tip.id }).where({ :vote_type => false }).count+1
    
    if the_vote.valid?
      the_vote.save
      the_tip.save
      redirect_to("/tips/#{the_vote.tip_id}", { :notice => "Vote created successfully." })
    else
      redirect_to("/tips", { :notice => the_vote.errors.full_messages })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vote = Vote.where({ :id => the_id }).at(0)

    the_vote.vote_type = params.fetch("query_vote_type", false)
    the_vote.tip_id = params.fetch("query_tip_id")
    the_vote.user_id = session.fetch(:user_id)
    
    if the_vote.valid?
      the_vote.save
      redirect_to("/votes/#{the_vote.id}", { :notice => "Vote updated successfully."} )
    else
      redirect_to("/votes/#{the_vote.id}", { :alert => "Vote failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vote = Vote.where({ :id => the_id }).at(0)

    the_vote.destroy

    redirect_to("/votes", { :notice => "Vote deleted successfully."} )
  end
end
