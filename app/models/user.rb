class User < ApplicationRecord
  has_many :roles, foreign_key: "actor_id"
  has_many :audition_requests, foreign_key: "actor_id"
  has_many :productions, foreign_key: "actor_id", through: :roles
  has_many :productions, foreign_key: "studio_id"



end
