fears = ["Death","Public speaking","Heights","Darkness","Intimacy", "Failure",
        "Rejection","Spiders","Success","Judgment","Embarrassment","Abandonment","Loss","Flying","Dogs","Dentists","Snakes","Needles","Being alone", "Clowns", "Change", "Germs","Crowds", "Thunder", "Hospitals", "Birds","Ghosts", "Bees", "Small spaces"]
timeFrames = [3,5,7,14,30]



# Users
photo = Faker::Avatar.image("", "100x100", "jpg")
User.create!(alias: "Nic",
             photo_url: photo,
             email: "nas231@nyu.edu",
             password:              "nicholas",
             password_confirmation: "nicholas",
             created_at: Time.zone.now)


10.times do |n|
  email = "email#{n+1}@gmail.com"
  password = "nicholas"
  aliasName = Faker::Name.first_name
  newUser = User.create!(alias: aliasName,
              photo_url: Faker::Avatar.image(aliasName, "80x80", "jpg"),
              email: email,
              password: password,
              password_confirmation: password,
              created_at: Time.zone.now)
end

# Journeys
User.all.each do |user|
  fear = fears.sample
  details = Faker::Lorem.paragraph
  journey = Journey.create!(fear: fear, details:details, num_supporters:0)
  journey.user_id = user.id
  journey.save
end

#Goals
Journey.all.each do |journey|
  deadline =  Time.now + (timeFrames.sample * 24 * 60 * 60)
  details = Faker::Lorem.paragraph
  goal = Goal.create!(details:details, isAchieved:false, deadline:deadline)
  goal.journey_id = journey.id
  goal.save
end

#Posts
Journey.all.each do |journey|
  content = Faker::Lorem.paragraph
  post = Post.create!(content:content)
  post.journey_id = journey.id
  post.save
  content = Faker::Lorem.paragraph
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
