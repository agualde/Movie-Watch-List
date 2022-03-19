# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all

i = 1

while i < 484

  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=85a82b2fa01bce0b77d430c48db47f86&language=en-US&page=#{i}"

  json = URI.open("#{url}").read
  data = JSON.parse(json)
  movies = data['results']
  movies.each do |movie|
    Movie.create(title: movie['original_title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}", english_title: movie['title'])
  end
  i += 1
  puts "#{i} pages of movies created"
end
