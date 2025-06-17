class PinsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :authorize_owner!, only: [ :edit, :update, :destroy ]
  # Solamente usuarios que subieron sus imágenes tienen acceso para editar o eliminarlas las mismas

  def index
    @pins = Pin.all.order(created_at: :desc)
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to root_path, notice: "Foto subida exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Foto editada exitosamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to root_path, notice: "Foto eliminada exitosamente.", status: :see_other
  end

  private

  # Para evitar que usuarios accedan directamente a la opción editar
  def authorize_owner!
    @pin = Pin.find(params[:id])
    redirect_to root_path, alert: "No tienes permiso para realizar esta acción." unless @pin.user == current_user
  end

  def pin_params
    params.require(:pin).permit(:description, :image)
  end
end
