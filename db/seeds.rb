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
JoinOption.destroy_all

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
  rand(2..5).times do
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
  n[:required] = rand_boolean
  n.save!
end
puts "number range questions created."



puts "creating respondent..."
Survey.all.each do |s|
  5.times do
    s = Survey.first
    r = Respondent.new
    r[:name] = "Mother fucker"
    r[:survey_id] = s.id
    r.save!

    if s.has_multi_questions?
      s.all_multi_questions_with_text.each do |question|
        options = question.response_options.pluck(:id).shuffle
        mr = MultiResponse.new
        mr[:respondent_id] = r.id
        mr[:question_id] = question.id
        if question.multi_select?
          mr.response_option_ids=[options.pop, options.pop]
        else
          mr.response_option_ids=[options.pop]
        end
        mr.save!
      end
    end

    if s.has_num_ranges?
      s.all_num_questions.each do |question|
        rr = RangeResponse.new
        rr[:respondent_id] = r.id
        rr[:num_range_id] = question.id
        rr[:answer] = rand(question.input_range)
        rr.save!
      end
    end

  end
end


# Create one survey without questions
s = Survey.new
s[:title] = Faker::Lorem.sentence
s[:description] = Faker::Lorem.paragraph
s.save!

puts "Done."
