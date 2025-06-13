class PinsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @pins = Pin.all.order(created_at: :desc)
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to root_path, notice: "Pin creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:description, :image)
  end
end
