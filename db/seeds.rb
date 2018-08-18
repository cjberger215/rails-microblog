# ! raises an exception rather than returning false for an invalid user
User.create!(name:  'Example User',
             email: 'example@railstutorial.org',
             password:              'foobar',
             password_confirmation: 'foobar')

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
