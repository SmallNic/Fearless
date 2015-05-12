# Users
User.create!(email: "nas231@nyu.edu",
             password:              "nicholas",
             password_confirmation: "nicholas",
             created_at: Time.zone.now)


10.times do |n|
  email = "nic#{n}@nyu.edu"
  password = "nicholas"
  User.create!(email: email,
              password:              password,
              password_confirmation: password,
              created_at: Time.zone.now)
end

# Journeys
User.all.each do |user|
  fear = Faker::Lorem.word
  details = Faker::Lorem.sentence(3)
  journey = Journey.create!(fear: fear, details:details)
  journey.user_id = user.id
  journey.save
end

# # Following relationships
# nic = User.find(email:"nas231@nyu.edu")
# following = users[5..10]
# followers = users[8..20]
# following.each { |followed| nic.follow(followed) }
# followers.each { |follower| follower.follow(nic) }
