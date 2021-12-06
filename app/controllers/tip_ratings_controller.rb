class TipRatingsController < ApplicationController
  def index
    matching_tip_ratings = TipRating.all

    @list_of_tip_ratings = matching_tip_ratings.order({ :created_at => :desc })

    render({ :template => "tip_ratings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tip_ratings = TipRating.where({ :id => the_id })

    @the_tip_rating = matching_tip_ratings.at(0)

    render({ :template => "tip_ratings/show.html.erb" })
  end

  def create
    the_tip_rating = TipRating.new
    the_tip_rating.tip_id = params.fetch("query_tip_id")
    the_tip_rating.user_id = session.fetch(:user_id)
    the_tip_rating.rating_value = params.fetch("query_rating_value")

    if the_tip_rating.valid?
      the_tip_rating.save
      redirect_to("/tip_ratings", { :notice => "Tip rating created successfully." })
    else
      redirect_to("/tip_ratings", { :notice => "Tip rating failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tip_rating = TipRating.where({ :id => the_id }).at(0)

    the_tip_rating.tip_id = params.fetch("query_tip_id")
    the_tip_rating.user_id = params.fetch("query_user_id")
    the_tip_rating.rating_value = params.fetch("query_rating_value")

    if the_tip_rating.valid?
      the_tip_rating.save
      redirect_to("/tip_ratings/#{the_tip_rating.id}", { :notice => "Tip rating updated successfully."} )
    else
      redirect_to("/tip_ratings/#{the_tip_rating.id}", { :alert => "Tip rating failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tip_rating = TipRating.where({ :id => the_id }).at(0)

    the_tip_rating.destroy

    redirect_to("/tip_ratings", { :notice => "Tip rating deleted successfully."} )
  end
end
