# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

# good practice to reset the seed data, because you dont wnat dups.


user_1 = User.create(username: "Andy")
user_2 = User.create(username: "Victor")
user_3 = User.create(username: "Andrea")
user_4 = User.create(username: "Deborah")



artwork_1 = Artwork.create(title: "legend of victor", image_url: "victorsimage.com", artist_id: user_2.id )
artwork_2 = Artwork.create(title: "the great andy", image_url: "andythegreat.com", artist_id: user_1.id)
artwork_3 = Artwork.create(title: "a for andrea", image_url: "aforandrea.com", artist_id: user_3.id)
artwork_4 = Artwork.create(title: "deb bor ahhhh", image_url: "deb.com", artist_id: user_4.id)
artwork_5 = Artwork.create(title: "kyles birthday cake", image_url: "cakepicture.com", artist_id: user_2.id)



ArtworkShare.create(artwork_id: artwork_1.id, viewer_id: user_3.id)
ArtworkShare.create(artwork_id: artwork_2.id, viewer_id: user_3.id)
ArtworkShare.create(artwork_id: artwork_3.id, viewer_id: user_3.id)
ArtworkShare.create(artwork_id: artwork_4.id, viewer_id: user_1.id)
ArtworkShare.create(artwork_id: artwork_5.id, viewer_id: user_2.id)

