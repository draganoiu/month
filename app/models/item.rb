class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  
  validates :title, presence: true
    validates :text, presence: true

    acts_as_votable
end
