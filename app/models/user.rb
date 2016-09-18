class User < ActiveRecord::Base
  has_many :note_users
  has_many :notes, through: :note_users
end
