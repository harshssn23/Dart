class Person
  attr_accessor :name, :hobbies

  def initialize(name, hobbies_str)
    @name = name
    set_hobbies(hobbies_str)
  end

  def set_hobbies(hobbies_str)
    @hobbies = hobbies_str.split(",").map(&:strip)
  end

  def common_hobbies(other_person)
    @hobbies & other_person.hobbies
  end

  def similar_people(people)
    people.reject { |person| person == self }.sort_by do |person|
      common_hobbies(person).length
    end.reverse
  end
end


person1 = Person.new("Alya", "Watching TV, Book Reading, Stunt Kites, Bicycles")
person2 = Person.new("Barbie", "Watching TV, Stunt Kites, Photography")
person3 = Person.new("Cindrella", "Bicycles,Book Reading, Photography")

puts "Common hobbies between #{person1.name} and #{person2.name}: #{person1.common_hobbies(person2).join(", ")}"
puts "People similar to #{person1.name}:"
person1.similar_people([person2, person3]).each do |similar_person|
  puts "#{similar_person.name} - Common Hobbies: #{person1.common_hobbies(similar_person).join(", ")}"
end
