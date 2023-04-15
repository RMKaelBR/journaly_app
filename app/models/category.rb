class Category < ApplicationRecord
  belongs_to :user
    has_many :tasks
  # scope :by_user, lambda { |user| where(:user_id => user.id) }
  scope :by_user, lambda { |user| 
        where(:user_id => user.id)
    }
end
