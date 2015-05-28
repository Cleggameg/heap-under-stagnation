require 'faker'

user1 = User.create(username: "paul", email: "paul@paul.com", password: "12345")
user2 = User.create(username: "sara", email: "sara@sara.com", password: "12345")
user3 = User.create(username: "taylor", email: "taylor@taylor.com", password: "12345")
user4 = User.create(username: "chase", email: "chase@chase.com", password: "12345")

20.times do |n|
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "1234567")
end

10.times do |n|
  samples = User.all.sample(10)
  asker = samples.pop
  asker.questions.create!(title: Faker::Lorem.characters(10), content: Faker::Lorem.paragraph)
end

100.times do |n|
  sample_u = User.all.sample(10)
  sample_q = Question.all.sample(10)
  user = sample_u.pop
  question = sample_q.pop
  question.answers.create!(content: Faker::Lorem.paragraph, answerer: user)
end

10.times do |n|
  sample_u = User.all.sample(10)
  sample_q = Question.all.sample(10)
  sample_a = Answer.all.sample(10)
  user = sample_u.pop
  question = sample_q.pop
  answer = sample_a.pop
  question.comments.create!(content: Faker::Lorem.paragraph, commenter: user)
  answer.comments.create!(content: Faker::Lorem.paragraph, commenter: user)
end

1050.times do |n|
  sample_u = User.all.sample(10)
  sample_q = Question.all.sample(10)
  sample_a = Answer.all.sample(10)
  user_vote = [1,-1].sample
  user = sample_u.pop
  question = sample_q.pop
  answer = sample_a.pop
  question.votes.create!(direction: user_vote, voter: user)
  answer.votes.create!(direction: user_vote, voter: user)
end








