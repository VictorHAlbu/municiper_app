class ResidentsController < ApplicationController

  def index
    @residents = Resident
      .search(search_params, params[:search])
  end

  def new
    @resident = Resident.new
    @resident.addresses.build
  end

  def create
    @resident = Resident.create(valid_params)
  end

  private
  
  def valid_params
    addresses_attributes =
        %i[id zipcode street complement neighboorhood city state ibge_code]
        
    params.require(:resident)
          .permit(:full_name, :document, :health_card_document, :email,
                  :phone, :birthdate, :status, :photo, addresses_attributes: addresses_attributes)
  end

  def search_params
    ["residents.full_name", "residents.email", "residents.addresses", "residents.status"]
  end
  
end
