require 'pstore'
Person = Struct.new(:name, :gender)


joe = Person.new('joe', 'male')

sam = Person.new('sam', 'male')


store = PStore.new("storagefile")
store.transaction do
	 store[:people] ||= Array.new
	 store[:people]  << joe
	 store[:people]  << sam
end


newstore = PStore.new('storagefile')

users = []

newstore.transaction do
	users =  newstore[:people]
end

users.each do |user|
	puts user.name + ' ' + user.gender
end
