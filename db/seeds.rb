# image_data1 = File.read('app/assets/images/Student_1.jpg')
# image_data2 = File.read('app/assets/images/Student_2.jpg')
# image_data3 = File.read('app/assets/images/Student_3.jpg')
# image_data4 = File.read('app/assets/images/Student_4.jpg')
# image_data5 = File.read('app/assets/images/Student_5.jpg')
# image_data6 = File.read('app/assets/images/Student_6.jpg')
# image_data7 = File.read('app/assets/images/Student_7.jpg')
# image_data8 = File.read('app/assets/images/teacherpic.jpg')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying time trials'
TimeTrial.destroy_all
puts 'destroying lessons'
Lesson.destroy_all
puts 'destroying students'
Student.destroy_all
puts 'destroying attendances'
Attendance.destroy_all
puts 'destroying teachers'
Teacher.destroy_all




puts 'creating teacher'

teacher = Teacher.create!(

  first_name: "James",
  last_name: "Devereux",
  email: "james@gmail.com",
  password: "secret",
  photo: File.open("./app/assets/images/teacherpic.jpg")
)

puts 'teacher created'

puts 'creating courses'

course_one = Course.create!(
  name: "English Communication A",
  description: "1st year English speaking class",
  school: "Kanto Gakuin University",
  teacher: Teacher.all.sample
  )

course_two = Course.create!(
  name: "English Communication B",
  description: "2nd year English speaking class",
  school: "Kanto Gakuin University",
  teacher: Teacher.all.sample
  )

puts 'courses created!'

puts 'creating 2 lessons'

Lesson.create!(
  learning_goal: "Talk about your hometown",
  time_goal: 30,
  start_time: DateTime.new(2019,3,8,11,5,6,'+03:00'),
  end_time: DateTime.new(2019,3,8,4,12,6,'+03:00'),
  completed: true,
  # teacher_id: 1
  teacher: Teacher.all.sample,
  course_id: course_one.id
)

Lesson.create!(
  learning_goal: "Talk about sports",
  time_goal: 30,
  start_time: Time.now,
  end_time: Time.now,
  completed: false,
  # teacher_id: 1
  teacher: Teacher.all.sample,
  course_id: course_one.id
)

puts '2 lesson created'

puts 'creating 6 students'

Student.create!(
  first_name: "Junki",
  last_name: "Ishida",
  birth_date: Date.new,
  email: "junki@gmail.com",
  password: "secret",
  student_number: "18EF074",
  photo: File.open("./app/assets/images/junki.png"),
  course_id: course_one.id
)


Student.create!(
  first_name: "Mana",
  last_name: "Kuriya",
  birth_date: Date.new,
  email: "mana@gmail.com",
  password: "secret",
  student_number: "18EF095",
  photo: File.open("./app/assets/images/girl1.jpg"),
  course_id: course_one.id

)

Student.create!(
  first_name: "Shinichi",
  last_name: "Kurimoto",
  birth_date: Date.new,
  email: "shinichi@gmail.com",
  password: "secret",
  student_number: "18EK001",
  photo: File.open("./app/assets/images/man1.jpg"),
  course_id: course_one.id

)

Student.create!(
  first_name: "Yuya",
  last_name: "Mano",
  birth_date: Date.new,
  email: "yuya@gmail.com",
  password: "secret",
  student_number: "18EK004",
  photo: File.open("./app/assets/images/man2.jpg"),
  course_id: course_one.id
)

Student.create!(
  first_name: "Hikaru",
  last_name: "Kojima",
  birth_date: Date.new,
  email: "hikaru@gmail.com",
  password: "secret",
  student_number: "18EK007",
  photo: File.open("./app/assets/images/girl2.jpg"),
  course_id: course_one.id
)

Student.create!(
  first_name: "Ryo",
  last_name: "Fujiwara",
  birth_date: Date.new,
  email: "ryo@gmail.com",
  password: "secret",
  student_number: "18EF081",
  photo: File.open("./app/assets/images/ryo.jpg"),
  course_id: course_one.id
)


puts '6 students created'

puts 'creating 6 attendances'


# Student.find_each do |student|
#   attendance = Attendance.create!(
#   student: student,
#   lesson: Lesson.first)
# end

Student.find_each do |student|
  attendance = Attendance.create!(
  student: student,
  lesson: Lesson.last)
end


# puts '20 attendances created'
