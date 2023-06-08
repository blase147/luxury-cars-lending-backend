# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user_one = User.create({full_name: 'Paul', email: 'solarmails2@mail.com', password: '1234567890'});



puts "Creating Cars"
cars = Car.create(
    {
        name:"Coupe",
        brand:"BMW",
        image: 'https://images.pexels.com/photos/977003/pexels-photo-977003.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        lending_fee:2,
        description: 'Black Covertible Coupe',

    });
cars = Car.create({
        name:"Alpine",
        brand:"Audi",
        image: 'https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        lending_fee:5,
        description: 'Blue Alpine Car.',

    });
cars = Car.create({
        name:"Lamborghini",
        brand:"Toyota",
        image: 'https://images.pexels.com/photos/3752194/pexels-photo-3752194.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        lending_fee:8,
        description: 'Gray Lamborghini.',

    });
cars = Car.create({
        name:"Mercedes",
        brand:"Benz",
        image: 'https://images.pexels.com/photos/164654/pexels-photo-164654.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        lending_fee:10,
        description: 'Orange Mercedes Benz G63.',

    });

puts "Cars Created"
