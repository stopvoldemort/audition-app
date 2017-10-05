class MovieGetter

  attr_accessor :actors, :roles, :film, :studio, :id, :film_doc

  def initialize(id)
    @actors = []
    @roles = []
    @film = {}
    @studio = {}
    @id = id
    @film_doc = scrape_imdb_film
  end

  def seed
    self.fill_in_data
    self.create_studio_hash

    studio = User.find_by(email: self.studio[:email])
    if !studio
      studio = User.create(self.studio)
    end

    self.create_production_hash
    Production.create(self.film)

    self.create_array_of_actor_hashes
    self.actors.each do |actor|
      actor_found = User.find_by(name: actor[:name])
      if !actor_found
        User.create(actor)
      end
    end

    self.create_array_of_role_hashes
    self.roles.each do |role|
      Role.create(role)
    end
  end


  def create_studio_hash
    self.studio[:password_digest] = "$2a$10$pInkFXeOJoectRZQZC3vtOPvIaNWWWCmcyxs9Pw28pxIPkj3H.FWK"
    first_name = self.studio[:name].split(" ")[0].downcase
    self.studio[:email] = "#{first_name}@studio.com"
    self.studio[:base_salary] = nil
    self.studio[:is_studio] = 1
    self.studio[:bio] = nil
    self.studio[:headshot] = nil
  end

  def create_array_of_actor_hashes
    self.actors.each do |actor|
      actor[:password_digest] = "$2a$10$pInkFXeOJoectRZQZC3vtOPvIaNWWWCmcyxs9Pw28pxIPkj3H.FWK"
      email_name = actor[:name].split(" ").join("").downcase
      actor[:email] = "#{email_name}@actor.com"
      actor[:base_salary] = 10000
      actor[:is_studio] = 0
    end
  end

  # Can only run after fill_in_data, and studio has been created
  def create_production_hash
    self.film[:budget] = 1000000
    self.film[:production_type] = "Film"
    self.film[:date_begin] = "2000-01-01 09:00:00"
    self.film[:date_end] = "2000-01-02 09:00:00"
    self.film[:studio_id] = User.find_by(email: self.studio[:email]).id
  end

  # Can only run after fill_in_data, studio, production, and actor has been created
  def create_array_of_role_hashes
    self.roles.each do |role|
      role[:description] = nil

      # Set actor_id
      actor = User.find_by(name: role[:actor])
      role[:actor_id] = actor.id
      role.delete(:actor)

      # Set production_id
      production = Production.find_by(title: self.film[:title])
      role[:production_id] = production.id
    end
  end



  def fill_in_data
    self.extract_film_and_studio
    self.extract_roles
    self.extract_actors
    @film_doc = "filled in"
  end

  def extract_film_and_studio
    omdb_url = ['http://www.omdbapi.com/?i=', @id, "&apikey=71937d11"].join("")
    response = RestClient.get(omdb_url)
    data = JSON.parse(response)
    @film[:title] = data["Title"]
    @film[:description] = data["Plot"]
    @studio[:name] = data["Production"]
  end


  def extract_roles
    [2, 3, 4, 5].each do |i|
      xpath_string = ['//table[@class="cast_list"]/tr[', i, ']'].join('')
      rows = self.film_doc.xpath(xpath_string)

      # Get actor name
      actor_name = rows[0].css('.itemprop .itemprop').text


      # Get role name
      role_name = rows[0].css('.character a').text
      @roles << {actor: actor_name, name: role_name}
    end
    @roles
  end



  def extract_actors
    self.get_actor_ids.each do |actor_id|
      doc = self.scrape_imdb_actor(actor_id)

      pic = doc.css('#img_primary div a img')
      pic_url = pic[0].attributes["src"].value

      name_element = doc.css('#overview-top h1 span')
      name = name_element[0].text

      bio = doc.css('#name-bio-text div div').text
      bio = bio.split("\n").reject { |c| c.empty? }[0]

      @actors << {remote_headshot_url: pic_url, name: name, bio: bio}
    end
  end




  def get_actor_ids
    [2, 3, 4, 5].map do |i|
      xpath_string = ['//table[@class="cast_list"]/tr[', i, ']'].join('')
      rows = @film_doc.xpath(xpath_string)

      # Get actor id
      # rows[0].children[1].children[1].attributes["href"].value[6..14]
      rows[0].css('.primary_photo a')[0].attributes["href"].value[6..14]
    end
  end

  def scrape_imdb_film
    url = ["http://www.imdb.com/title/", @id, "/"].join("")
    @film_doc = Nokogiri::HTML(open(url))
  end

  def scrape_imdb_actor(id)
    url = ["http://www.imdb.com/name/", id, "/"].join("")
    # @film_doc = Nokogiri::HTML(open(url))
    Nokogiri::HTML(open(url))
  end


end




# Films have titles(done), studios, descriptions
# Actors have names(done), bios, photos, salaries
# Roles have names, descriptions, Films and Actors
