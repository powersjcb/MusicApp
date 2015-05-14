class BandsController < ApplicationController
def index
  @bands = Band.all
end

def create
  @band = Band.new(band_params)

  if @band.save
    # flash.[:success] = ["Sucessfully created band"]
    redirect_to band_url(@band)
  else
    # flash.now[:error] = @band.errors.full_messages
    render :new
  end
end

def new
  @band = Band.new
end

def edit
  @band = Band.find(params[:id])
end

def show
  @band = Band.find(params[:id])
end

def update
  @band = Band.new(band_params)
  if @band.save
    # flash[:success] = ["Successfully updated band"]
    redirect_to band_url(@band)
  else
    # flash.now[:error] = @band.errors.full_messages
    render :edit
  end
end

def destroy
  @band = Band.find(params[:id])
  @band.destroy

  redirect_to bands_url
end


private
  def band_params
    params.require(:band).permit(:name)
  end
end
