class User < ApplicationRecord
  has_many :roles, foreign_key: "actor_id", dependent: :destroy
  has_many :audition_requests, foreign_key: "actor_id", dependent: :destroy
  has_many :productions, foreign_key: "studio_id", dependent: :destroy
  has_secure_password

  mount_uploader :headshot, HeadshotUploader

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

  def has_roles?
    !self.roles.empty?
  end

  def salary(production_type)
    if self.base_salary
      case production_type
      when "Film"
        self.base_salary * 2.5
      when "Television Show"
        self.base_salary * 1.5
      when "Commercial"
        self.base_salary * 1.0
      when "Play"
        self.base_salary * 0.8
      when "Short Film"
        self.base_salary * 0.7
      when "Experimental"
        self.base_salary * 0.5
      end
    end
  end




end
