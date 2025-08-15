class Post < ApplicationRecord

  belongs_to :user

  validates :title, :body, length: { minimum: 4 }
  validates :title, length: { maximum: 30 }
  validates :body, length: { maximum: 300 }

end
