class Log < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :practice_day, presence: true
  validates :serve, :smash, :volley, :stroke, :game,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 1440 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
