class Note < ActiveRecord::Base

  has_many :note_users
  has_many :users, through: :note_users# belongs_to :user

end
