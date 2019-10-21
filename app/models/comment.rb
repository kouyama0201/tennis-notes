class Comment < ApplicationRecord
  belongs_to :log
  belongs_to :user
end
