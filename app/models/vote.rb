# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  score      :integer
#  user_id    :integer
#  link_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :score, presence: true, numericality: { only_integer: true}

  def update_score(score)
    self.update(:score => self.score = score)
  end
end
