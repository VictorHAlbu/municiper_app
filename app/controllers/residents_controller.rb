class ResidentsController < ApplicationController

  def index
    @residents = Resident
      .search(search_params, params[:search])
  end

  def new
    @resident = Resident.new
    @resident.addresses.build
  end

  private

  def search_params
    ["residents.full_name", "residents.email", "residents.addresses", "residents.status"]
  end
  
end
