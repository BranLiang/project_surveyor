# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroy all old surveys..."

Survey.destroy_all
Question.destroy_all
NumRange.destroy_all
ResponseOption.destroy_all

puts "All old data destroyed."

# Create 3 surveys survey
puts "creating surveys..."
3.times do
  s = Survey.new
  s[:title] = Faker::Lorem.sentence
  s[:description] = Faker::Lorem.paragraph
  s.save!
end
puts "surveys created."

def rand_boolean
  [true, false].sample
end

def add_options m
  rand(1..6).times do
    r = ResponseOption.new
    r[:text] = Faker::Lorem.sentence
    r[:question_id] = m.id
    r.save!
  end
end

# Create multi option questions
puts "creating multiple option questions..."
10.times do
  m = Question.new
  m[:text] = Faker::Lorem.sentence
  m[:survey_id] = Survey.pluck(:id).sample
  m[:multi_select] = rand_boolean
  m[:required] = rand_boolean
  m.save!
  add_options(m)

  m[:options] = m.response_options.size
  m.save!
end
puts "Multiple option questions added"

puts "creating number range questions..."
6.times do
  n = NumRange.new
  n[:text] = Faker::Lorem.sentence
  n[:minimum] = rand(1..5)
  n[:maximum] = rand(6..10)
  n[:survey_id] = Survey.pluck(:id).sample
  n[:required] = true
  n.save!
end
puts "number range questions created."

# Create one survey without questions
s = Survey.new
s[:title] = Faker::Lorem.sentence
s[:description] = Faker::Lorem.paragraph
s.save!

puts "Done."
