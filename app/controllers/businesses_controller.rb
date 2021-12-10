class BusinessesController < ApplicationController
  def index
    matching_businesses = Business.all

    @list_of_businesses = matching_businesses.order({ :business_name => :asc })

    render({ :template => "businesses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_businesses = Business.where({ :id => the_id })

    @the_business = matching_businesses.at(0)

    #Pulling tips related to a particular business
    @tips_for_business = Tip.where({ :business_id => @the_business }).order({ :created_at => :desc })

    render({ :template => "businesses/show.html.erb" })
  end

  def create
    the_business = Business.new
    the_business.business_name = params.fetch("query_business_name")
    the_business.business_description = params.fetch("query_business_description")
    the_business.address = params.fetch("query_address")

    if the_business.valid?
      the_business.save
      redirect_to("/businesses", { :notice => "Business created successfully." })
    else
      redirect_to("/businesses", { :notice => "Business failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_business = Business.where({ :id => the_id }).at(0)

    the_business.business_name = params.fetch("query_business_name")
    the_business.business_description = params.fetch("query_business_description")
    the_business.address = params.fetch("query_address")

    if the_business.valid?
      the_business.save
      redirect_to("/businesses/#{the_business.id}", { :notice => "Business updated successfully."} )
    else
      redirect_to("/businesses/#{the_business.id}", { :alert => "Business failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_business = Business.where({ :id => the_id }).at(0)

    the_business.destroy

    redirect_to("/businesses", { :notice => "Business deleted successfully."} )
  end
end
