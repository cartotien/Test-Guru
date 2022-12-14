# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!(
  [
    { title: 'Backend' },
    { title: 'Frontend' },
    { title: 'Fallout' }
  ]
)

users = User.create!(
  [
    { first_name: 'Peter', last_name: 'Griffin', email: 'Peter@griffin.com', encrypted_password: "8de75e71a5fe5c344d7c4849816db191e6fb60c8", password: 'Stewie', type: 'Admin' },
    { first_name: 'Lois', last_name: 'Griffin', email: 'Lois@griffin.com', encrypted_password: "8de75e71a5fe5c344d7c4849816db191e6fb60c8", password: 'Stewie', type: 'Admin' }
  ]
)

tests = Test.create!(
  [
    { title: 'Basic Ruby Test', level: 1, author_id: users[0].id, category_id: categories[0].id },
    { title: 'Basic JavaScript Test', level: 1, author_id: users[1].id, category_id: categories[1].id },
    { title: 'Fallout: NV Lore Test', level: 2, author_id: users[0].id, category_id: categories[2].id },
    { title: 'Fallout 2 Test', level: 3, author_id: users[1].id, category_id: categories[2].id }
  ]
)

questions = Question.create!(
  [
    { body: 'Where Great Khan at Boulder City tells you to go to meet with Benny?', test_id: tests[2].id },
    { body: 'Who was one of the founders of Caesars Legion?', test_id: tests[2].id },
    { body: 'What does frozen string literal do?', test_id: tests[0].id },
    { body: 'Whats object_id?', test_id: tests[0].id },
    { body: 'Whats the name of the temple where you start the game?', test_id: tests[3].id },
    { body: 'Are there classes in JavaScript?', test_id: tests[1].id },
    { body: 'Whats JavaScript?', test_id: tests[1].id }
  ]
)

Answer.create!(
  [
    { body: 'Tops', correct: true, question_id: questions[0].id },
    { body: 'Luxe', correct: false, question_id: questions[0].id },
    { body: 'Goodsprings', correct: false, question_id: questions[0].id },
    { body: 'Joshua Graham', correct: true, question_id: questions[1].id },
    { body: 'Ulysses', correct: false, question_id: questions[1].id },
    { body: 'Mr. House', correct: false, question_id: questions[1].id },
    { body: 'Freezes all strings', correct: true, question_id: questions[2].id },
    { body: 'There for beauty', correct: false, question_id: questions[2].id },
    { body: 'Memory address where object is stored', correct: true, question_id: questions[3].id },
    { body: 'Length of an object', correct: false, question_id: questions[3].id },
    { body: 'Temple of Trials', correct: true, question_id: questions[4].id },
    { body: 'Detention Temple', correct: false, question_id: questions[4].id },
    { body: 'Yes', correct: true, question_id: questions[5].id },
    { body: 'No', correct: false, question_id: questions[5].id },
    { body: 'Programming language', correct: true, question_id: questions[6].id },
    { body: 'Python framework', correct: false, question_id: questions[4].id }
  ]
)

TestPassage.create!(
  [
    { test_id: tests[0].id, user_id: users[0].id }
  ]
)
