class HeadbandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :find_headband, only: [:show]


  def index
    @headbands  = Headband.all
  end

  def show
  end

  private

  def find_headband
    @headband = Headband.find(params[:id])
  end

  def headband_params
    params.require(:headband).permit(:name, :description)
  end

end
