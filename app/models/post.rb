class Post < ApplicationRecord

  belongs_to :user
  validates :title, presence:true, length: {maximum:50}
  validates :body, presence:true, length: {maximum:200}

  FILE_NUMBER_LIMIT = 4
  validate :validate_number_of_files


  has_many_attached :images
  has_many :post_comments, dependent: :destroy


  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def self.looks(search, word)
    if search == "perfect"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward"
      @Post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward"
      @Post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial"
      @Post = Post.where("title LIKE?","%#{word}%")
    else
      @Post = Post.all
    end
  end



  def get_image
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
      images
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  private

  def validate_number_of_files
    return if images.length <= FILE_NUMBER_LIMIT
    errors.add(:images, "は#{FILE_NUMBER_LIMIT}枚までしか投稿できません")
  end

end
