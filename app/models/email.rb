class Email < ActiveRecord::Base

  belongs_to :user

  validates :requestor_id, :presence => true
  validates :objective, :presence => true
    validates :deadline, :presence => true

end
