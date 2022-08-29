class ResidentsController < ApplicationController

  def index
    @residents = Resident.search(search_params, params[:search])
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def new
    @resident = Resident.new
    @resident.addresses.build
  end

  def create
    @resident, @addresses =
      Residents::CreatorService.call(valid_params: valid_params)
    if @resident.save
      redirect_to residents_path
    else
      flash[:errors] = "New User created."
    end  
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
