class Production < ApplicationRecord
  belongs_to :studio, class_name: "User"
  has_many :roles
  has_many :actors, class_name: "User", through: :roles
  has_many :audition_requests, through: :roles
end
