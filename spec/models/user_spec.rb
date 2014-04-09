
# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  email                 :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  username              :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

require 'spec_helper'

describe User do

  it{should have_secure_password}

  it{should validate_presence_of(:email)}
  it{should validate_presence_of(:password)}
  it{should ensure_length_of(:password).is_at_least(5)}
  it{should validate_presence_of(:password_confirmation)}
  it{should validate_presence_of(:username)}

  it{should have_and_belong_to_many(:links)}
  it{should have_many(:votes).through(:links)}

  it do
  User.create!(
    email: 'j@dog.com',
    password: '12345',
    password_confirmation: '12345',
    username: 'jdog'
    )
  should validate_uniqueness_of(:email)
  should validate_uniqueness_of(:username)
  end


end
