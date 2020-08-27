class StocksController < ApplicationController

  def create
    @stock = Stock.create(stock_params)
    if @stock.save
      flash[:success] = "bingo "
      redirect_to stocks_path
    else
      flash[:error] = "failed "
      redirect_to stocks_path
    end
  end

  def new
    @stock = Stock.new(params[:Stock])
    @stocks = Stock.all
  end

  def index
    @stocks = Stock.all
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update_attributes(stock_params)
    flash[:notice] = "The stock of #{@stock.realrelease.name} was successfully updated."
    redirect_to stocks_path
  end

  def destroy
    Stock.find(params[:id]).destroy
     flash[:success] = "Stock deleted"
     redirect_to stocks_url
  end

  private

  def stock_params
    params.require(:stock).permit(:quantity, :price)
  end
end
