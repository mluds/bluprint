student = User.create(id: 1, email: 'student@bluprint.com', name: "Student Dude", password: 'password', password_confirmation: 'password', confirmed_at: Time.now, role: 0)
instructor = User.create(id: 2, email: 'instructor@bluprint.com', name: "Instructor Dude", password: 'password', password_confirmation: 'password', confirmed_at: Time.now, role: 1)
admin = User.create(id: 3, email: 'admin@bluprint.com', name: "Admin Dude", password: 'password', password_confirmation: 'password', confirmed_at: Time.now, role: 2)

instructor.students << student
admin.students << student

AuthorableProblem.create(user_id: 2, problem_text: "Aliquam erat volutpat. Pellentesque in tincidunt nunc. Suspendisse luctus posuere quam sit amet ultricies. Praesent feugiat quam volutpat dui placerat, sed tempor enim consequat. Morbi risus nulla, lobortis id porta.")
AuthorableProblem.create(user_id: 2, problem_text: "Curabitur scelerisque mauris nec interdum ullamcorper. In dictum orci vitae tortor tincidunt blandit. Sed pharetra nisl mauris, vel consequat enim semper in. Morbi vestibulum augue vel lacinia cursus. In hac.")
AuthorableProblem.create(user_id: 3, problem_text: "Quisque accumsan eros ac turpis pharetra, in accumsan magna vestibulum. Aliquam accumsan, lorem quis aliquet posuere, tellus dolor euismod augue, sit amet bibendum sem purus eu libero. Sed lacinia eu.")
