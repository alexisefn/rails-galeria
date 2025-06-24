class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to pin_path(@pin), notice: "Comentario añadido exitosamente." }
        # Renderizará create.turbo_stream.erb si la petición es de Turbo
        format.turbo_stream
      else
        # Si falla, simplemente redirigimos de vuelta con una alerta
        format.html { redirect_to pin_path(@pin), alert: "Error al añadir el comentario." }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
