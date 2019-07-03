class DjsController < ApplicationController

  def create
  @dj = Dj.create(dj_params)
  if @dj.save
    flash[:success] = "bingo niga"
    redirect_to djs_path
  else
    flash[:error] = "failed niga"
    redirect_to djs_path


  end
end

  def new
    @dj = Dj.new(params[:dj])
  end

  def index
    @djs = Dj.all
  end

  def edit
     @dj = Dj.find(params[:id])
  end

  def show
     @dj = Dj.find(params[:id])
  end

  def update
    @dj = Dj.find(params[:id])
    @dj.update_attributes(dj_params)
    flash[:notice] = "#{@dj.name} was successfully updated."
    redirect_to djs_path
  end

  def destroy
    Dj.find(params[:id]).destroy
     flash[:success] = "dj deleted"
     redirect_to djs_url
  end

  private

  def dj_params
    params.require(:dj).permit(:name)
  end
end
