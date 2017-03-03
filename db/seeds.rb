# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create(fullname:"Pooja Mokariya",email:"poojalm747@gmail.com",password:"12345678",password_confirmation:"12345678")
ary = [1,2,3,4,5]
ary.each do |i|
	@service = @user.services.new(title:"#{i}I will write 300 word blog posts",description:"I will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog postsI will write 300 word blog posts",price:"500",requirements:"1")
	@service.save
end

