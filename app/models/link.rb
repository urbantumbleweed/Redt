# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  link_url   :string(255)
#  title      :string(255)
#  tally      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  # validates that the user it's related to is valid when it's created
  # validates_associated :user


  validates(:link_url,:title,:tally,:user_id, presence: true)
  validates(:link_url,uniqueness: true)
  validates(:tally,numericality: {only_integer: true})


  def create_vote(user, score)
    Vote.create(:user_id => user.id, :link_id => self.id, :score => score)
  end

  def find_vote(user)
    Vote.where("link_id = ? AND user_id = ?", self.id, user.id).first
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
    # binding.pry

    if vote == nil
        self.create_vote(user, score_change)
        self.update_tally(score_change)
    elsif self.upvote(score_change, vote) || self.downvote(score_change, vote)
      vote.update_score(score_change)
       self.update_tally(score_change)
    elsif vote.score == score_change
      return "Already voted"
    end
    # binding.pry
  end



  # def upvote(user)
  #   if check_upvote(user)
  #   self.update(:tally => (self.tally+=1))
  #   else
  #   return "Already voted"
  #   end
  # end

  # def downvote(user)
  #   self.update(:tally => (self.tally-=1))
  #   if user.vote.includes? (self.id)
  #     Vote.update(:score=> score-1)
  #   end
  # end

  # def check_upvote(user)
  #   vote = Vote.where("link_id = ? AND user_id = ?", self.id, user.id).first
  #   if vote
  #     vote.update(:score=>vote.score +=1) if vote.score < 1
  #     return false
  #   elsif !user.votes.include?(self.id)
  #   Vote.create(:user_id => user.id,
  #     :link_id=>self.id, :score => 1)
  #   return true
  #   end
  # end

  # def check_downvote(user)
  #   vote = Vote.where("link_id = ? AND user_id = ?", self.id, user.id).first
  #   if vote
  #     vote.update(:score => vote.score -=1) if vote.score > -1
  #     return false
  #   elsif !user.votes.include?(self.id)
  #     Vote.create(:user_id => user.id, :link_id => self.id, :score => -1)
  #     return true
  #   end   
  # end


end
