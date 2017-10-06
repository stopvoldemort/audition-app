# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Titanic
MovieGetter.new("tt0120338").seed

# Inside Out
MovieGetter.new("tt2096673").seed

# Jurassic Park
MovieGetter.new("tt0107290").seed

# Green Mile
MovieGetter.new("tt0120689").seed

# Deuce Bigelow
MovieGetter.new("tt0205000").seed

# Mission Impossible
MovieGetter.new("tt0117060").seed

# Adaptation
MovieGetter.new("tt0268126").seed

# Can't Hardly Wait
MovieGetter.new("tt0127723").seed

# Breakfast Club
MovieGetter.new("tt0088847").seed

# Mad Max: Fury Road
MovieGetter.new("tt1392190").seed
