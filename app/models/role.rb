class Role < ApplicationRecord
  belongs_to :production
  belongs_to :actor, class_name: "User", optional: true
  has_many :audition_requests, dependent: :destroy
  #validates :name, presence: true

  after_create :check_nil


  def check_nil
    Role.last(3).each do |role|
      role.destroy if role.name == ""
    end
  end

  def auditioned
    self.audition_requests.select do |req|
      req.accepted
    end.map {|req| req.actor }
  end

  def self.unfilled_roles_for_logged_in_studio(session_id)
    @studio = User.find_by(id: session_id)
    if @studio.is_studio==1
      @studio.productions.map do |p|
        p.roles.select {|r| !r.actor_id}
      end.flatten
    end
  end

  def role_in_production
    "#{self.name} in '#{self.production.title}'".truncate(35)
  end

end
