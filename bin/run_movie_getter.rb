require 'pry'
require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'
require_relative '../app/models/movie_getter'

gem 'rest-client'



Pry.start

FILMS_WITH_ID = [{title: "jurassic park", id: "tt0107290"},
                 {title: "clueless", id: "tt0112697"}]


'q'
