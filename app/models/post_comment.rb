class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  FILE_NUMBER_LIMIT = 4
  validate :validate_number_of_files

  has_many_attached :post_comment_images
  validates :comment, presence:true, length: {maximum:200}

  def get_image
      post_comment_images
  end

  private

  def validate_number_of_files
    return if post_comment_images.length <= FILE_NUMBER_LIMIT
    errors.add(:post_comment_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end
