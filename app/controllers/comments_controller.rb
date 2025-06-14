class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    # 1. Encontrar el Pin al que se le va a añadir el comentario
    @pin = Pin.find(params[:pin_id])

    # 2. Crear el comentario asociado a ese Pin y al usuario actual
    @comment = @pin.comments.build(comment_params)
    @comment.user = current_user

    # 3. Guardar el comentario y redirigir
    if @comment.save
      redirect_to pin_path(@pin), notice: "Comentario añadido exitosamente."
    else
      redirect_to pin_path(@pin), alert: "Error al añadir el comentario."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
