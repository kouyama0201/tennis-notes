class Like < ApplicationRecord
  belongs_to :user
  belongs_to :log, counter_cache: :likes_count
end
