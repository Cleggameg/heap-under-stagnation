class Question < ActiveRecord::Base
  include Voteable

  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :asker, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true, length: { in: 5..50}
  validates :content, presence: true

  def self.sort_popular
    all.sort_by{|question| question.total_votes}.reverse
  end

  def sort_popular_answers
    self.answers.sort_by{|answer| answer.total_votes}.reverse
  end

end
