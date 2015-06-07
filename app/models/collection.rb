class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :pictures
end
