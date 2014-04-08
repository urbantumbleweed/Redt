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

class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :links
  has_many :votes, through: :links

  validates(:email, :password, :password_confirmation, :username, presence: true)
  validates(:email,:username, uniqueness: true)
  validates(:password, length:{minimum: 5})
  validates(:password, confirmation: true)
end
