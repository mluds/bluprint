# Create users
user_ids = 1..100

Fabricator(:user) do
  name { Faker::Name.name }
  email { |attrs| Faker::Internet.free_email(attrs[:name]) }
  password { 'password' }
  password_confirmation { |attrs| attrs[:password] }
  confirmed_at { Time.now }
  role { User.roles.values.sample }
end

user_ids.each do |id|
  Fabricate(:user, id: id)
end

User.roles.each do |k, v|
  Fabricate(
    :user,
    id: user_ids.end + 1 + v,
    email: k.to_s + '@bluprint.com',
    role: v
  )
end

user_ids = user_ids.begin .. (user_ids.end + User.roles.length)


# Create authorable problems
auth_prob_ids = 1..100

Fabricator(:authorable_problem) do
  user_id { rand(user_ids) }
  problem_text { Faker::Lorem.paragraph }
end

auth_prob_ids.each do |id|
  Fabricate(:authorable_problem, id: id)
end


# Add student-instructor relations
User.where(role: User.roles[:instructor]).each do |instructor|
  students = Array.new(User.all)
  10.times do
    s = students.sample
    students.delete(s)
    instructor.students << s
  end
end
