# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user_1= User.create( name: 'Marieth', email: 'marieth@gmail.com',role: 'admin', password: '123456')
@user_2= User.create( name: 'Juan', email: 'juan@gmail.com',role: 'Empleado',password: '123456')
@user_3= User.create( name: 'Liz', email: 'lis@gmail.com',role: 'Empleado', password: '123456')

dialing_1 = Dialing.create( date: "2019-10-01",user_id: 1, category: "Entry", hour: 9 , minute: 0)
dialing_2 = Dialing.create( date: "2019-10-01",user_id: 1, category: "Exit", hour: 18, minute: 30)
dialing_3 = Dialing.create( date: "2019-10-05",user_id: 1, category: "Entry", hour: 9 , minute: 0)
dialing_4 = Dialing.create( date: "2019-10-05",user_id: 1, category: "Exit", hour: 18, minute: 30)
dialing_5 = Dialing.create( date: "2019-10-02",user_id: 1, category: "Entry", hour: 9 , minute: 10)
dialing_6 = Dialing.create( date: "2019-10-02",user_id: 1, category: "Exit", hour: 18, minute: 30)
dialing_7 = Dialing.create( date: "2019-11-01",user_id: 1, category: "Entry", hour: 9 , minute: 5)
dialing_8 = Dialing.create( date: "2019-11-01",user_id: 1, category: "Exit", hour: 18, minute: 20)
dialing_9 = Dialing.create( date: "2019-10-01",user_id: 2, category: "Entry", hour: 10 , minute: 20)
dialing_10 = Dialing.create( date: "2019-10-01",user_id: 2, category: "Exit", hour: 19, minute: 30)
