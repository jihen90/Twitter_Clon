# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all

frank = User.create(name: 'frank', profilephoto: 'https://onebarkplaza.com/wp-content/uploads/2021/02/bernese-mountain-dog-100x100.jpg', email: 'frank@ex.com', password: 'abcd1234' )
alice = User.create(name: 'alice', profilephoto: 'https://i1.sndcdn.com/artworks-DEZpZ2eWve7nO7Vo-ahcjWQ-large.jpg', email: 'alice@ex.com', password: 'abcd1234' )
anton = User.create(name: 'anton', profilephoto: 'https://davesgarden.com/static/img/dg_noimage_bird.png', email: 'anton@ex.com', password: 'abcd1234' )

Tweet.delete_all

6.times do |index|
    Tweet.create( content: "Pizza is yummy!"                   , user: frank )
    Tweet.create( content: "Veggies are tasty and nutritious." , user: alice )
    Tweet.create( content: "Salt is the best ingredient."      , user: anton )
    Tweet.create( content: "I've seen Star Wars 23 times."      , user: frank )
    Tweet.create( content: "Walking Dead has an exciting plot." , user: alice )
    Tweet.create( content: "I only watch art-house films."      , user: anton )
    Tweet.create( content: "My cats are cute!"      , user: frank )
    Tweet.create( content: "Dogs are good friends." , user: alice )
    Tweet.create( content: "My hamster resents me." , user: anton )
    Tweet.create( content: "Free market solves all problems."         , user: frank )
    Tweet.create( content: "Workers control the means of production." , user: alice )
    Tweet.create( content: "Can't we all just get along?"             , user: anton )
end

