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

end
