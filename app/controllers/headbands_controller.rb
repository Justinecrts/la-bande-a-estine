class HeadbandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :find_headband, only: [:show]

  def index
    if params[:category]
      @headbands = Headband.where(:category => params[:category])
    else
      @headbands = Headband.all
    end
  end

  def show
  end

  private

  def find_headband
    @headband = Headband.find(params[:id])
  end

  def headband_params
    params.require(:headband).permit(:name, :description, photos: [])
  end

end
