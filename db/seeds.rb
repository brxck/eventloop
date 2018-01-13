# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rubocop:disable Style/DateTime

brock = User.create(name: 'Brock', email: 'brxck@test.com', password: 'test',
                    password_confirmation: 'test')

tori = User.create(name: 'Tori', email: 'toast@test.com', password: 'test',
                   password_confirmation: 'test')

appa = User.create(name: 'Appa', email: 'moocat@test.com', password: 'test',
                   password_confirmation: 'test')

brock.events.build(name: 'March Against Trump', location: 'The Streets',
                   datetime: DateTime.now,
                   description: "It's gonna be a long four years.").save

brock.events.last.attendees << [tori, appa]

brock.events.build(name: 'Solar Eclipse 2017', location: 'Targee National Forest',
                   datetime: DateTime.new(2017, 8, 21, 10, 30),
                   description: 'Guaranteed to blow your mind.').save

brock.events.last.attendees << [tori, appa]

brock.events.build(name: 'Reunion', location: 'My Place',
                   datetime: DateTime.now + 7,
                   description: 'Come together! Right now. Over me.').save

brock.events.last.attendees << [tori, appa]

tori.events.build(name: 'House Party', location: 'Our New Place',
                  datetime: DateTime.now + 180,
                  description: 'Come party at our new apartment!').save

appa.events.build(name: 'Lorem Ipsum', location: 'Dolor Sit Amet',
                  datetime: DateTime.now + 1000,
                  description: 'Consectetur adipiscing elit, sed do eiusmod'\
                  ' tempor incididunt ut labore et dolore magna aliqua. Ut enim'\
                  ' ad minim veniam, quis nostrud exercitation ullamco laboris'\
                  ' nisi ut aliquip ex ea commodo consequat. Duis aute irure'\
                  ' dolor in reprehenderit in voluptate velit esse cillum'\
                  ' dolore eu fugiat nulla pariatur. Excepteur sint occaecat'\
                  ' cupidatat non proident, sunt in culpa qui officia deserunt'\
                  ' mollit anim id est laborum.').save
