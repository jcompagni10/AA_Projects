class Student
  attr_accessor :courses
  def initialize(first, last)
    @name = [first, last]
    @courses = []
  end

  def first_name
    @name[0]
  end

  def last_name
    @name[1]
  end

  def name
    @name.join(" ")
  end

  def enroll(course)
    if !courses.include?(course)
      conflict = courses.any? { |enrolled_course| enrolled_course.conflicts_with?(course) }
      raise 'Course Conflict Homie' if conflict
      courses.push(course)
      course.students << self
    end
  end

  def course_load
    departments = Hash.new(0)
    courses.each{|course| departments[course.department] += course.credits}
    departments
  end

end
