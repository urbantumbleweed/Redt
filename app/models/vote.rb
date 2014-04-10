class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :score, presence: true, numericality: { only_integer: true}

   def update_score(score)
    self.update(:score => self.score += score)
  end
end
