
puts 'emptying DB'
User.destroy_all
Transaction.destroy_all
Asset.destroy_all
puts 'DB empty'

puts 'seeding users'
5.times do 
    User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email)
end
puts 'users seeded'

puts 'seeding assets'
50.times do 
    t =  Asset.create(investment_name: Faker::Company.name, investment_amount: Faker::Number.number(digits:7),user_id: User.all.sample.id)
if !t.id
    puts t.errors.full_messages
end
 end
 puts 'assets seeded'

puts 'seeding transactions'
50.times do 
    t = Transaction.create(vendor_name:Faker::Company.name, amount_spent: Faker::Commerce.price(range: 0..1000, as_string: false), user_id:User.all.sample.id, asset_id:Asset.all.sample.id)
    if !t.id
        puts t.errors.full_messages
    end
end
puts "transactions done"
# puts 'seeding transactions'
# 5.times do 
#     Transaction.create(vendor: Faker::Company.name, cost: Faker::Commerce.price(range: 0..1000, as_string: false), user: User.all.sample)
# end
# puts 'transactions seeded'



