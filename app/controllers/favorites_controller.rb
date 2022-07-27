class FavoritesController < ApplicationController
  def create
    destination = Destination.find(params[:destination_id])
    favorite = current_user.favorites.new(destination_id: destination.id)
    favorite.save
    redirect_to destination_path(destination)
  end

  def destroy
    destination = Destination.find(params[:destination_id])
    favorite = current_user.favorites.find_by(destination_id: destination.id)
    favorite.destroy
    redirect_to destination_path(destination)
  end


end
