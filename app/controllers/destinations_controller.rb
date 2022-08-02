class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @destinations = Destination.page(params[:page]).order(created_at: :desc)
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user_id = current_user.id
    if @destination.save
      redirect_to destinations_path
    else
      render :new
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to destination_path(@destination), notice: "You have updated post successfully."
    else
      render :edit
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:spot_name, :spot_introduction, :image, :prefecture, :city, :transportation, :route, :hotel, :exchange, :other_info, :checkbox,transportation_pays:[], destination_pays:[], hotel_pays:[])
  end

end
