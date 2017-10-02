class AuditionRequest < ApplicationRecord
  belongs_to :actor, class_name: "User"
  belongs_to :role
end
