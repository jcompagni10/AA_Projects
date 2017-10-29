# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username:'ndnd'},{username:'shshs'},{username:'dodood'}])

artworks = Artwork.create([{title:'chicken',image_url:'www.jdjj.com',artist_id:4},
  {title:'bird',image_url:'www.jdj.com',artist_id:8}])

artwork_shares =ArtworkShare.create([{artwork_id:1,viewer_id:4},{artwork_id:2,viewer_id:8}])

comments = Comment.create([{user_id: 4, artwork_id: 3, body: "wow cool"},
                           {user_id: 4, artwork_id: 3, body: "Awesome"},
                           {user_id: 8, artwork_id: 2, body: "this sucks"},
                           {user_id: 8, artwork_id: 4, body: "blahasdf"},
                           {user_id: 12, artwork_id: 6, body: "I don't like art about animals"}])
