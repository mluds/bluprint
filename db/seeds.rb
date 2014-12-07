Fabricator(:user) do
  name { Faker::Name.name }
  email { |attrs| Faker::Internet.free_email(attrs[:name]) }
  password { 'password' }
  password_confirmation { |attrs| attrs[:password] }
  confirmed_at { Time.now }
  role { User.roles.values.sample }
end

Fabricator(:authorable_assignment) do
  title { Faker::Lorem.sentence }
end

Fabricator(:authorable_problem) do
  problem_text { Faker::Lorem.paragraph }
end

Fabricator(:assignment) do
  authorable_assignment { AuthorableAssignment.all.sample }
end

Fabricator(:problem) do
  completed { [true, false].sample }
  attempts do |attrs|
    if attrs[:completed]
      r = 1..6
    else
      r = 0..4
    end
    r.to_a.sample
  end
end

puts "Creating users.."
100.times { Fabricate(:user) }

User.roles.each do |key, val|
  Fabricate(
    :user,
    email: key.to_s + '@bluprint.com',
    role: val
  )
end

instructors = User.where(
  role: [User.roles[:instructor], User.roles[:administrator]]
)

puts "Assigning students to instructors.."
instructors.each do |instructor|
  students = Array.new(User.all)

  10.times do
    s = students.sample
    students.delete(s)
    instructor.students << s
  end
end

puts "Creating authorable assignments.."
instructors.each do |instructor|
  5.times do
    Fabricate(:authorable_assignment, user: instructor)
  end
end

puts "Creating authorable problems.."
instructors.each do |instructor|
  10.times do
    Fabricate(:authorable_problem, user: instructor)
  end
end

puts "Assigning authorable problems to authorable assignments.."
AuthorableAssignment.all.each do |auth_assign|
  5.times do
    auth_assign.auth_probs << AuthorableProblem.all.sample
  end
end

puts "Creating assignments.."
User.all.each do |user|
  5.times do
    assign = Fabricate(:assignment, user: user)
    assign.authorable_assignment.auth_probs.each do |auth_prob|
      assign.problems << Fabricate(
        :problem,
        assignment: assign,
        authorable_problem: auth_prob
      )
    end
  end
end
