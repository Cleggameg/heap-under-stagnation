class Answer < ActiveRecord::Base
  include Voteable

  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :answerer, class_name: "User", foreign_key: "user_id"

  validates :content, presence: true
end
