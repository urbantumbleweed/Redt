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


require 'spec_helper'

describe Link do

  it{should validate_presence_of(:link_url)}
  it{should validate_presence_of(:title)}
  it{should validate_presence_of(:tally)}

  it{should validate_uniqueness_of(:link_url)}

  it{should validate_numericality_of(:tally).only_integer}

  it{should belong_to(:user)}

  end

