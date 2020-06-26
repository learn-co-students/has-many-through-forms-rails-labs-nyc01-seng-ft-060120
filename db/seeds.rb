# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |cat|
  Category.create(
    name: "category #{cat}"
  )
end

3.times do |post|
  Post.create(
    title: "post title #{post}",
    content: "post content #{post}"
  )
end

PostCategory.create(
  post_id: Post.first.id, 
  category_id: Category.first.id
)

PostCategory.create(
  post_id: Post.second.id, 
  category_id: Category.first.id
)
PostCategory.create(
  post_id: Post.third.id, 
  category_id: Category.first.id
)


User.create(
  username: "Amanda",
  email: "amanda@amanga.com"
)

3.times do |comment|
  Comment.create(
    content: "comment content #{comment}",
    user_id: User.first.id,
    post_id: Post.first.id
  )
end