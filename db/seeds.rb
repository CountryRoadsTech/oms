# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: 'richard@email.com', name: 'Richard Marting', password: 'password',
             password_confirmation: 'password', confirmed_at: Time.current,
             profile: 'I am Richard.')

User.create!(email: 'collen@email.com', name: 'Coleen Person', password: 'password',
             password_confirmation: 'password', confirmed_at: Time.current,
             profile: 'I am C.')

a = User.create!(email: 'addisonejmartin@gmail.com', name: 'Addison Martin', password: 'password',
                 password_confirmation: 'password', confirmed_at: Time.current,
                 profile: 'I am Addison.')

Page.create!(user: a, title: 'About', subtitle: 'About our Organization', published_at: Time.current,
             body: 'We are Ottawa Food Rescue.')

Page.create!(user: a, title: 'Donate', subtitle: 'How to Help our Community', published_at: Time.current,
             body: 'We support: ...')

Page.create!(user: a, title: 'Contact', subtitle: 'Get in touch!', published_at: Time.current,
             body: 'We would love to hear from you!')

Article.create!(user: a, title: "Ottawa Food Rescue's offical website launches!", published_at: Time.current,
                body: "Please join us in celebrating the launch of our offical, dedicated website! \
                This is only the beginning of the expansion of our online presence, check back \
                later for more. Thank you.")
