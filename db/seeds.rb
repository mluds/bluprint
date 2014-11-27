# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'example@gmail.com', name: "Example User", password: 'password', password_confirmation: 'password', confirmed_at: Time.now)
AuthorableProblem.create(user_id: 1, problem_text: "Aliquam erat volutpat. Pellentesque in tincidunt nunc. Suspendisse luctus posuere quam sit amet ultricies. Praesent feugiat quam volutpat dui placerat, sed tempor enim consequat. Morbi risus nulla, lobortis id porta.")
AuthorableProblem.create(user_id: 1, problem_text: "Curabitur scelerisque mauris nec interdum ullamcorper. In dictum orci vitae tortor tincidunt blandit. Sed pharetra nisl mauris, vel consequat enim semper in. Morbi vestibulum augue vel lacinia cursus. In hac.")
AuthorableProblem.create(user_id: 1, problem_text: "Quisque accumsan eros ac turpis pharetra, in accumsan magna vestibulum. Aliquam accumsan, lorem quis aliquet posuere, tellus dolor euismod augue, sit amet bibendum sem purus eu libero. Sed lacinia eu.")
