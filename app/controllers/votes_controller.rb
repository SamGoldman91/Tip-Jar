class VotesController < ApplicationController
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
    the_vote.user_id = params.fetch("query_user_id")

    if the_vote.valid?
      the_vote.save
      redirect_to("/votes", { :notice => "Vote created successfully." })
    else
      redirect_to("/votes", { :notice => "Vote failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_vote = Vote.where({ :id => the_id }).at(0)

    the_vote.vote_type = params.fetch("query_vote_type", false)
    the_vote.tip_id = params.fetch("query_tip_id")
    the_vote.user_id = params.fetch("query_user_id")

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
