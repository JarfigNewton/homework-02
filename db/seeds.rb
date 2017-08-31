# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book_type = ['fiction', 'nonfiction']

classification = [
  'General Works - encyclopedias',
  'Philosophy, Psychology, Religion',
  'History - Auxiliary Sciences',
  'History (except American)',
  'General U.S. History',
  'Local U.S. History',
  'Geography, Anthropology, Recreation',
  'Social Sciences U',
  'Political Science V',
  'Law Z - Bibliography and Library Science',
  'Education',
  'Music',
  'Fine Arts',
  'Language and Literature',
  'Science',
  'Medicine',
  'Agriculture',
  'Technology',
  'Military',
  'Naval Science',
  'Bibliography and Library Science'
]

25.times do |item|
  Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(12, 85)
  )
end

50.times do |item|
  Book.create!(
    title: Faker::Book.title,
    genre: Faker::Book.genre,
    classification: classification.sample,
    book_type: book_type.sample,
    year: Faker::Number.between(1700, 2017),
    sub_title: Faker::LordOfTheRings.location
  )
end

Book.all.each do |book|
  author_id = Author.all.sample.id
  Authorship.create!(
    book_id: book.id,
    author_id: author_id
  )
end