# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do
  Category.create(name: Faker::Commerce.product_name)
end

20.times do

  user = User.create(email: Faker::Internet.email, password: 'password')

  5.times do
    post = Post.create(
      title: Faker::Company.buzzword,
      content: Faker::Hipster.paragraph(2, false, 4),
      user: user
    )

    post.categories << Category.all.sample(rand(0..3))

    3.times do 
      post.comments.create(
        content: Faker::ChuckNorris.fact,
        user: User.all.sample
      )
    end
  end

end