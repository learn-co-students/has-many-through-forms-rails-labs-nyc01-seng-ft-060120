# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create multiple users
10.times do
  User.create!({:username => Faker::Internet.username, :email => Faker::Internet.email})
end

# Create categories
(rand(15) + 5).times do
  Category.create!(:name => Faker::Book.genre)
end

# Create posts
(rand(30) + 10).times do
  # Create the post
  post = Post.create!(:title => Faker::Book.title, :content => Faker::Quote.famous_last_words)

  # Assign it random categories
  (rand(5) + 1).times do
    category = Category.all.sample
    # Add the joiner table
    PostCategory.create!(:post_id => post.id, :category_id => category.id)
  end
end

# Finally add the comments
(rand(100) + 20).times do
  post = Post.all.sample
  user = User.all.sample
  Comment.create!(:content => Faker::Lorem.paragraph, :user_id => user.id, :post_id => post.id)
end
