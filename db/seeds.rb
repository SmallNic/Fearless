fears = ["Death","Public speaking","Heights","Darkness","Intimacy", "Failure",
        "Rejection","Spiders","Success","Judgment","Embarrassment","Abandonment","Loss","Flying","Dogs","Dentists","Snakes","Needles","Being alone", "Clowns", "Change", "Germs","Crowds", "Thunder", "Hospitals", "Birds","Ghosts", "Bees", "Small spaces"]



# Users
User.create!(alias: "Nic",
             email: "nas231@nyu.edu",
             password:              "nicholas",
             password_confirmation: "nicholas",
             created_at: Time.zone.now)


10.times do |n|
  email = "email#{n+1}@gmail.com"
  password = "nicholas"
  newUser = User.create!(alias: Faker::Name.first_name,
              email: email,
              password: password,
              password_confirmation: password,
              created_at: Time.zone.now)
end

# Journeys
User.all.each do |user|
  fear = fears.sample
  details = Faker::Lorem.sentence(3)
  journey = Journey.create!(fear: fear, details:details)
  journey.user_id = user.id
  journey.save
end

#Goals
Journey.all.each do |journey|
  details = Faker::Lorem.sentence(2)
  goal = Goal.create!(details:details, isAchieved:false)
  goal.journey_id = journey.id
  goal.save
end

#Posts
Journey.all.each do |journey|
  content = Faker::Lorem.sentence(4)
  post = Post.create!(content:content)
  post.journey_id = journey.id
  post.save
  content = Faker::Lorem.sentence(4)
  post = Post.create!(content:content)
  post.journey_id = journey.id
  post.save
end

# # Following relationships
# nic = User.find(email:"nas231@nyu.edu")
# following = users[5..10]
# followers = users[8..20]
# following.each { |followed| nic.follow(followed) }
# followers.each { |follower| follower.follow(nic) }
