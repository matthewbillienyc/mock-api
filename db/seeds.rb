# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: "admin@admin.com", password: "bug", password_confirmation: "bug", first_name: "Swaylor", last_name: "Tift", role: "admin")

def create_popsicle
  Popsicle.new(flavor: Faker::Commerce.product_name, color: Faker::Color.color_name, rating: Faker::Number.number(1), 
               shape: ['square', 'round'].sample, serial_number: Faker::Number.number(8))
end

def create_stick
  Stick.new(wood_type: Faker::Commerce.product_name, color: Faker::Color.color_name, centimeters: Faker::Number.number(1))
end

def create_joke
  Joke.new(question: Faker::Hipster.sentence(3), punchline: Faker::Lorem.word, dirtiness: Faker::Number.number(1), funniness: Faker::Number.number(1), author: Faker::Name.name)
end

def create_company
  Company.create(name: Faker::Company.name, popsicle_varieties: 0)
end

def create_popsicle_and_dependencies(company)
  popsicle = create_popsicle
  stick = create_stick
  joke = create_joke

  popsicle.stick = stick
  popsicle.stick.joke = joke

  company.popsicles << popsicle

  company.save
end

def create_companies_and_popsicles
  2.times do
    create_company
  end

  Company.all.each do |company|
    20.times do 
      create_popsicle_and_dependencies(company)
    end
  end
end

create_companies_and_popsicles
