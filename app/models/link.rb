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
  # validates that the user it's related to is valid when it's created
  validates_associated :user

  validates(:link_url,:title,:tally,:user_id, presence: true)
  validates(:link_url,uniqueness: true)
  validates(:tally,numericality: {only_integer: true})

end
