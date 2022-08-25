class ResidentsController < ApplicationController

  def idex
    @residents = Resident
      .search(search_params, params[:search])
  end

  private

  def search_params
    ["residents.full_name", "residents.email", "residents.addresses", "residents.status"]
  end
end
