class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pin

  def create
    @pin.likes.where(user: current_user).first_or_create

    respond_to do |format|
      format.html { redirect_to @pin } # Fallback para navegadores muy viejos sin JS
      format.turbo_stream # Responderá con create.turbo_stream.erb
    end
  end

  def destroy
    @pin.likes.where(user: current_user).destroy_all

    respond_to do |format|
      format.html { redirect_to @pin }
      format.turbo_stream # Responderá con destroy.turbo_stream.erb
    end
  end

  private

  def set_pin
    @pin = Pin.find(params[:pin_id])
  end
end
