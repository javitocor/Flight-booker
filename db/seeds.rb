#ActiveRecord::Migration.drop_table(:airports)
#ActiveRecord::Migration.create_table(:airports)
#ActiveRecord::Migration.drop_table(:flights)
#ActiveRecord::Migration.create_table(:flights)
20.times do
    Airport.create!(
      name: Faker::Address.country,
      code: Faker::Address.country_code_long
    )
end

200.times do
    time = rand(30..600)
    airport = Airport.all.sample
    airport2 = Airport.all.sample
    Flight.create!(
        from_airport: Airport.find(airport.id),
        to_airport: Airport.find(airport2.id),
        start:DateTime.now+rand(100),
        duration: time
    )
end