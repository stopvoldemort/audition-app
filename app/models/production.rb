class Production < ApplicationRecord
  belongs_to :studio, class_name: "User"
  has_many :roles, dependent: :destroy
  has_many :actors, class_name: "User", through: :roles
  has_many :audition_requests, through: :roles

  accepts_nested_attributes_for :roles

end
