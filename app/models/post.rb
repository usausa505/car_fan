class Post < ApplicationRecord
  
  belongs_to :user
  validates :title, presence:true, length: {maximum:50}
  validates :body, presence:true, length: {maximum:200}
  
  has_many_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
      image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
