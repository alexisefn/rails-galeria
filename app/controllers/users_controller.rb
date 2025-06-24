class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # Los pins (imágenes publicadas) que el usuario ha creado
    @pins = @user.pins.order(created_at: :desc)

    # Los pins que le han gustado al usuario, ordenados por cuándo le dio "Me Gusta"
    # Se usa la asociación :liked_pins previamente creada en el modelo User
    @liked_pins = @user.liked_pins.order("likes.created_at DESC")
  end
end
