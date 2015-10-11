# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def topic_create
topic = Topic.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, focus_area: Faker::Lorem.word, user_id: 3)
end

if Topic.count < 100
  100.times.map {topic_create}
end

def interest_create
  scores = [1,2,3,4,5]
  @topic = Topic.find(15)
  @interest = @topic.interests.new(comment: Faker::Lorem.paragraph, score: scores.sample, user_id: 3, topic_id: 15)
  @interest.save
  @topic.interest_count += 1
  score = @interest.score
  @topic.interest_score += score
  @topic.rating = @topic.interest_score / @topic.interest_count
  @topic.save
end

if Interest.count < 100
  100.times.map {interest_create}
end
