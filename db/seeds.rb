# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin

    @seed = Seed.new
    @seed.generate_groups
  end

  def generate_groups
    20.times do |i|
      group = Group.create!(
        name: Faker::Games::Pokemon.name,
        description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10)
      )
      5.times do |i|
        author = Faker::Name.first_name
        message = Message.create!(group_id: group.id, author: author, content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10))
      puts "Group #{i}: Name is #{group.name} and description is '#{group.description}'."
      p "created #{Message.count} Messages"
    end
  end
end
end
Seed.begin
