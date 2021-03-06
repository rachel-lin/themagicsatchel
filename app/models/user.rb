class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :image_posts, dependent: :destroy
  has_many :videos, dependent: :destroy

  def admin?
    role == 'admin'
  end

end
