class Post < ActiveRecord::Base


  belongs_to :user
  has_many :categories
  has_many :comments
  scope :recent, -> {order("created_at desc").limit(3)}

end
