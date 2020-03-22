class Log < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy, inverse_of: :log
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :practice_day, presence: true
  validates :serve, :smash, :volley, :stroke, :game,
            presence: true,
            numericality: { only_integer: true }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
