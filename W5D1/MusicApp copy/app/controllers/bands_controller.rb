class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = ["Nope - try again."]
      redirect_to new_band_url
    end
  end

#bands/new
  def new
    @band = Band.new
    render :new
  end
#bands/edit
  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      render :show
    else
      flash[:errors] = ['Can\'t update']
      redirect_to edit_band_url
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
