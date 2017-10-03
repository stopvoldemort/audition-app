class User < ApplicationRecord
  has_many :roles, foreign_key: "actor_id"
  has_many :audition_requests, foreign_key: "actor_id"
  has_many :productions, foreign_key: "studio_id"
  has_secure_password

  def actor_productions
    self.roles.map do |r|
      r.production
    end.flatten
  end

  def self.actors
    self.all.select {|user| user.is_studio == 0}
  end

  def self.current_user_actor?(id)
    self.find(id).is_studio == 0
  end




end
