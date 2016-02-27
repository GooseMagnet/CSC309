User.create!(name:  "Ilan Admin Karasik",
             email: "ilankarasik@gmail.com",
             password:              "iAdmin",
             password_confirmation: "iAdmin",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end