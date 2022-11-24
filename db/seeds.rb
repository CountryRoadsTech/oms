# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: Rails.application.credentials.seed_data.richard.email,
             name: 'Richard M',
             password: Rails.application.credentials.seed_data.richard.password,
             password_confirmation: Rails.application.credentials.seed_data.richard.password,
             confirmed_at: Time.current,
             profile: 'I am Richard.')

User.create!(email: Rails.application.credentials.seed_data.coleen.email,
             name: 'Coleen L',
             password: Rails.application.credentials.seed_data.coleen.password,
             password_confirmation: Rails.application.credentials.seed_data.coleen.password,
             confirmed_at: Time.current,
             profile: 'I am Coleen.')

a = User.create!(email: Rails.application.credentials.seed_data.addison.email,
                 name: 'Addison M',
                 password: Rails.application.credentials.seed_data.addison.password,
                 password_confirmation: Rails.application.credentials.seed_data.addison.password,
                 confirmed_at: Time.current,
                 profile: 'I am Addison.')

Page.create!(user: a, title: 'About', subtitle: 'About our Organization', published_at: Time.current,
             body: "Addressing food insecurity by working with donors, volunteers, and local charities \
             to ensure vulnerable individuals and families have access to quality food. So what happens \
             when a group of friends see an opportunity to address food insecurity in our city? Ottawa \
            Food Rescue (OFR) happens. Born from the desire to help the vulnerable in our community, \
            OFR volunteers transport overflow of dairy produce, and bakery items from supermarkets to \
            local charities. There, they are made available to those who would not otherwise have a meal. \
            Do you have a passion for community giving and helping the vulnerable? Make a large scale food \
            donation. Drive for OFR. Share other ways you might assist.")

Page.create!(user: a, title: 'Outreach', subtitle: 'How to Help our Community', published_at: Time.current,
             body: "Ottawa Food Rescue (OFR) works closely with Whole Foods Market to regular transport \
             quality surplus food to the following outreach programs: St Luke's Table: Provides a \
             supportive environment where visitors can maintain and improve their personal and \
             mental health in a safe and secure environment. St Luke's serves the homeless and \
             marginalized in Ottawa. http://www.stlukestable.ca/ The Well/LA Source: A \
             supportive and inclusive community where women gather to connect and build on their \
             strengths. https://www.the-well.ca Centre 454: A day program serving people who are \
             precariously housed or homeless in the Ottawa area. The Centre is committed to serving those \
             who require assistance in the form o support services, social recreation, and essential needs: \
             showers, laundry, phone and mailbox, spiritual support, ODSP application help, and more. \
             http://www.centre454.ca/ St. Joe's Women's Center: A day program that is dedicated to the needs \
             of women, in a supportive and safe environment. Social and educational programs are offered to \
             promoted empowerment, autotomy, and dignity in a non-judgmental atmosphere. \
             https://stjoeswomenscentre.org Chrysalis House: A safe and secure 25-bed shelter in Western \
             Ottawa. It is a place where a women can go to protect herself and her dependent's from violence \
             and abuse. In this supportive environment, a women can focus on her personnel needs and choices, \
             as well as on her dependent's needs. https://wocrc.ca/program/chrysalis-house/ Naomi's Family \
             Resource Centre: Provides safe, secure, confidential emergency shelter and support services to \
             women 16 years and older with or without children who are victims of family violence in any form. \
             Through renewed awareness of their strengths and resources women and children can establish violence \
             free lives in the community and reach their full human growth potential. https://naomiscentre.ca/ The \
             Ottawa Mission: The Mission addresses immediate needs while collaborating with community partners to \
             prioritize long-term solutions for poverty and homelessness. The Mission's wide array of programs \
            and services enable people to improve their lives an build brighter futures. \
            https://ottawamission.com/homelessness-in-ottawa/ Do you know of any food service establishments \
            that would like to donate food to support Ottawa's must vulnerable? Perhaps you are interested in \
            being a volunteer Ottawa Food Rescue drivers. If so, we would love to hear from you. <Contact page link>")

Page.create!(user: a, title: 'Contact', subtitle: 'Get in touch!', published_at: Time.current,
             body: "We would love to hear from you! Please send an email to ottawafoodrescue@gmail.com \
             Do you have a passion for community giving and helping the vulnerable? \
             Make a large scale food donation. Drive for Ottawa Food Rescue. \
             Share other ways you might assist. Do you know of any food service \
             establishments that would like to donate food to support Ottawa's \
             must vulnerable? Perhaps you are interested in being a volunteer \
             Ottawa Food Rescue drivers. If so, we would love to hear from you.")

Article.create!(user: a, title: "Ottawa Food Rescue's offical website launches!", published_at: Time.current,
                body: "Please join us in celebrating the launch of our official, dedicated website! \
                This is only the beginning of the expansion of our online presence, check back \
                later for more. Thank you.")
