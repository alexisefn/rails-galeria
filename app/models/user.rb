class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pins, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_pins, through: :likes, source: :pin

  # Para verificar que si el usuario actual ya dio Me Gusta a una foto
  def likes?(pin)
    liked_pins.include?(pin)
  end

  # Para definir "nombres de usuarios" dentro del sitio
  def username
    # self.email es el correo del usuario, ej: "usuario@ejemplo.com"
    # .split('@') lo divide en ["usuario", "ejemplo.com"]
    # .first toma el primer elemento: "usuario"
    # .capitalize lo pone con la primera letra en mayúscula: "Usuario"
    self.email.split('@').first.capitalize
  end
end
