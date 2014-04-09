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

require 'spec_helper'

describe Vote do

	it {should validate_presence_of(:score)}
	it {should validate_numericality_of(:score).only_integer}

	it {should belong_to(:user)}
	it {should belong_to(:link)}


end