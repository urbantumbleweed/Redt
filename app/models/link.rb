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


  def check_upvote(user)
    vote = Vote.where("link_id = ? AND user_id = ?", self.id, user.id).first
    if vote
      vote.update(:score=>vote.score +=1) if vote.score < 1
      return false
    elsif !user.votes.include?(self.id)
    Vote.create(:user_id => user.id,
      :link_id=>self.id, :score => 1)
    return true
    end
  end



  def upvote(user)
    if check_upvote(user)
    self.update(:tally => (self.tally+=1))
    else
    return "Already voted"
    end
  end

  def downvote(user)
    self.update(:tally => (self.tally-=1))
    if user.vote.includes? (self.id)
      Vote.update(:score=> score-1)
    end
  end


end
