namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
                 
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    50.times do
      text = Faker::Lorem.sentence(3)
      Question.create!(text: text)
    end
    
    questions = Question.all
    4.times do
      text = Faker::Lorem.sentence(1)
      questions.each { |question| question.choices.build(text: text, correct: false) }
    end
  end
end