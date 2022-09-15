# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create(
  [
    { title: 'Backend' },
    { title: 'Frontend' },
    { title: 'Fallout' }
  ]
)

users = User.create(
  [
    { name: 'Peter', email: 'Peter@griffin.com' },
    { name: 'Lois', email: 'Lois@griffin.com' }
  ]
)

tests = Test.create(
  [
    { title: 'Basic Ruby Test', level: 1, author_id: users[0].id, category_id: categories[0].id },
    { title: 'Basic JavaScript Test', level: 1, author_id: users[1].id, category_id: categories[1].id },
    { title: 'Fallout: NV Lore Test', level: 2, author_id: users[0].id, category_id: categories[2].id },
    { title: 'Fallout 2 Test', level: 3, author_id: users[1].id, category_id: categories[2].id },
    { title: 'Fallout 3 Test', level: 1, author_id: users[0].id, category_id: categories[2].id }
  ]
)

Question.create(
  [
    { body: 'Where Great Khan at Boulder City tells you to go to meet with Benny?', test_id: tests[2].id },
    { body: 'WWho was one of the founders of Caesars Legion?', test_id: tests[2].id },
    { body: 'What does frozen string literal do?', test_id: tests[0].id },
    { body: 'Whats object_id?', test_id: tests[0].id },
    { body: 'Whats the name of the temple where you start the game?', test_id: tests[3].id }
  ]
)
