class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, length: { minimum: 2, maximum:20}
  validates :name, presence: true
  validates :introduction, length: { maximum:50}


  # has_many :post_images, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  def email_required?
   false
 end
 def email_changed?
   false
 end

end
