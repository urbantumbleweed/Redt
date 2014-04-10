
class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates(:link_url,:title,:tally,:user_id, presence: true)
  validates(:link_url,uniqueness: true)
  validates(:tally,numericality: {only_integer: true})


   def create_vote(user, score)
    Vote.create(:user_id => user.id, :link_id => self.id, :score => score)
  end

  def find_vote(user)
    Vote.where(link_id: self.id).where(user_id: user.id).first
  end

  def update_tally(score)
    self.update(:tally => self.tally += score)
  end

  def upvote(score, vote)
    return (score > 0 && vote && vote.score < 1)
  end

  def downvote(score, vote)
    return (score < 0 && vote && vote.score > -1)
  end

  def score_link(user, score_change)
    vote = self.find_vote(user)

    if vote == nil
        self.create_vote(user, score_change)
        self.update_tally(score_change)
    elsif self.upvote(score_change, vote) || self.downvote(score_change, vote)
      vote.update_score(score_change)
       self.update_tally(score_change)
    elsif vote.score == score_change
      return "Already voted"
    end
  end


end
