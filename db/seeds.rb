# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brock = User.create(name: 'Brock', email: 'brxck@test.com', password: 'test',
                   password_confirmation: 'test')

tori = User.create(name: 'Tori', email: 'toast@test.com', password: 'test',
            password_confirmation: 'test')

appa = User.create(name: 'Appa', email: 'moocat@test.com', password: 'test',
            password_confirmation: 'test')

brock.events.build(name: 'Riot', location: 'In the streets', datetime: DateTime.now).save
brock.events.build(name: 'Afterparty', location: 'My place', datetime: DateTime.now).save
