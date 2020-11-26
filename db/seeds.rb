require 'faker'

Author.delete_all
Article.delete_all

10.times {
  Author.create( name: Faker::Book.unique.author)
}

50.times {
  Article.create({
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: rand(5..7)),
    author: Author.limit(1).order("RANDOM()").first # sql random
  })
}
