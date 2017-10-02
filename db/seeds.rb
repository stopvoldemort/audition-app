# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:"Dave Studios", password_digest: "12345", email:"test1@example.com", studio?: true, base_salary: nil )
User.create(name:"Amanda", password_digest: "12345", email:"test2@example.com", studio?: false, base_salary: 5000 )
Production.create(title: "Oklahoma!", production_type: "play", budget: "50000")
Production.create(title: "Kiss of the Spider Woman", production_type: "play", budget: "25000")
Production.create(title: "Les Mis", production_type: "play", budget: "40000", studio_id: 7)
Role.create(name: "Benny", role_type: "supporting", actor_id: 1, production_id: 1)
Role.create(name: "Lola", role_type: "lead", actor_id: 2, production_id: 2)
Role.create(name: "javier", role_type: "lead", actor_id: 7, production_id: 4)
AuditionRequest.create(actor_id: 8, role_id: 1, accepted?: true)
AuditionRequest.create(actor_id: 8, role_id: 2, accepted?: true)
