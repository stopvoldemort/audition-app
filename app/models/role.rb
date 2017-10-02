class Role < ApplicationRecord
  belongs_to :production
  belongs_to :actor, class_name: "User"
  has_many :audition_requests
end
