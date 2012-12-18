require 'rubygems'
require 'sqlite3'

$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true


def disconnect_and_quit
	$db.close
	puts "bye!"
	exit
end

def create_table
	puts "Creating people table"
	$db.execute %q{
		CREATE TABLE people(
		id integer primary key,
		name varchar(50),
		job varchar(50),
		gender varchar(10),
		age integer
		)
	}
end


def add_person
	puts "enter name:"
	name = gets.chomp
	puts "enter job:"
	job  = gets.chomp
 	puts "enter gender:"
	gender = gets.chomp
	puts "enter age:"
	age   = gets.chomp
	$db.execute("insert into people (name,job,gender,age) values(?,?,?,?)",name,job,gender,age)
end


def find_person
	puts "Enter name or ID of person to find:"
	id = gets.chomp

	person = $db.execute("select * from people where name=? or id=?",id,id.to_i).first


	unless person
		puts "no results found"
		return
	end

	puts %Q{Name: #{person['name']}
	Job: #{person['job']}
	Gender: #{person['gender']}
	Age: #{person['age']}}
end

loop do

puts %q{ Please select an option:

	1.Create people table
	2.Add a person
	3.Look for a person
	4.Quit
}

	case gets.chomp
		when '1'
			create_table
		when '2'
			add_person
		when '3'
			find_person
		when '4'
			disconnect_and_quit
	end

end
