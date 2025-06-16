class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pin

  def create
    @pin.likes.where(user: current_user).first_or_create
    redirect_to @pin, notice: "¡Te gusta esta foto!"
  end

  def destroy
    @pin.likes.where(user: current_user).destroy_all
    redirect_to @pin, notice: "Ya no te gusta esta foto."
  end

  private

  def set_pin
    @pin = Pin.find(params[:pin_id])
  end
end
