class Link < ActiveRecord::Base
  belongs_to :collection

  validates :text, presence: true
end
