class School
  def initialize 
    @roster = Hash.new {|hash,key| hash[key]=[]}
  end
   
  def add_student(name,grade)
    if @roster[grade].include?(name)
      puts " #{name} is already present in grade #{grade}"
    else
      @roster[grade]<<name 
      puts " #{name} added to grade #{grade}"
    end
  end

  def students_in_grade(grade)
    if @roster[grade].empty?
      puts " No students enrolled in grade #{grade} "
    else 
      puts " Students in grade #{grade} :  #{@roster[grade].sort.join(', ')}"
    end
  end

  def sorted_roster
    sorted_list = @roster.sort_by{|grade, students|grade}
    sorted_list.each do |grade,students|
      puts " grade #{grade}: #{students.sort.join(', ')}" unless students.empty? 
    end
  end
end

school = School.new

loop do 
puts " Choose your action: (1)Add student (2)View students in different grades (3)view entire roster (4) Exit"
choice = gets.chomp.to_i

  case choice 
  when 1
    puts " enter student name:"
    name = gets.chomp
    puts " enter student's grade(class)"
    grade = gets.chomp.to_i
    school.add_student(name,grade)

  when 2 
    puts " eter the grade(class):"
    grade = gets.chomp.to_i
    school.students_in_grade(grade)

  when 3 
    puts " complete roster view "
    school.sorted_roster

  when 4 
    puts" Thank you for visiting"
    break
  
  else
    puts " invalid choice"
  end
end