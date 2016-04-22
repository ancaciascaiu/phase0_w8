#Reuse code from previous challenges to build a database using ruby:
	#table attributes will be:
		#firstname,
		#lastname, (randomly made)
		#age(random number between 1 and 100),
		#membership(randomly true/false)
	#Output = the person who`s a member and has the longest first+last name will get a prize!

require 'sqlite3'
require 'faker'
#create database
db = SQLite3::Database.new("musemembers.db")
#db.results_as_hash = true

#create table
create_table = <<-SQL
	CREATE TABLE IF NOT EXISTS members(
		id INTEGER PRIMARY KEY,
		fname VARCHAR(255),
		lname VARCHAR(255),
		age INT,
		membership BOOLEAN
	)
SQL

db.execute(create_table)

#get random number between 1 and 100
def random_nr
	Random.rand(1...100)
end

#create 150 entries
def create_members(db, fname, lname, age, membership)
	db.execute("INSERT INTO members(fname, lname, age, membership) VALUES (?,?,?,?)", [fname, lname, age, membership])
	p fname.class
end

150.times do
	create_members(db, Faker::Name.first_name, Faker::Name.last_name, random_nr, ["true", "false"].sample)
end










