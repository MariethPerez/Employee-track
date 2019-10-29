# Documentation

## How to install

You need to install the Gemfile

```
bundle install

```

Now run the migrations and seeds

```
rails db:setup
```

after_create :notification_booking_created, :reservation_reminde
```

## This is the list user's

|  ROLE    |              EMAIL               | PASSWORD  |
| :-----:  | :------------------------------: | :-------: |
|  admin   |       marieth@gmail.com          | 123456    |
| empleado |        juan@gmail.com            | 123456    |
| empleado |        lis@gmail.com             | 123456    |

## This is a routes API's

| Prefix                      | Verb   | URI Pattern                                                      |
| :-------------------------- | :----- | :--------------------------------------------------------------- |
|                             | POST   | /login(.:format)                                                 |
| login                       | GET    | /login(.:format)                                                 |
| logout                      | DELETE    | /logout(.:format)                                             |
| users                       | GET    | /api/users(.:format)                                             |
|                             | POST   | /api/users(.:format)                                             |
| new_user                    | GET    | /api/users/new(.:format)                                         |
| edit_user                   | GET    | /api/users/:id/edit(.:format)                                    |
| user                        | GET    | /api/users/:id(.:format)                                         |
|                             | PATCH  | /api/users/:id(.:format)                                         |
|                             | PUT    | /api/users/:id(.:format)                                         |
|                             | DELETE | /api/users/:id(.:format)                                         |
| dialings                    | GET    | /api/dialings(.:format)                                          |
|                             | POST   | /api/dialings(.:format)                                          |
| new_dialing                 | GET    | /api/dialings/new(.:format)                                      |
| edit_dialing                | GET    | /api/dialings/:id/edit(.:format)                                 |
| dialing                     | GET    | /api/dialings/:id(.:format)                                      |
|                             | PATCH  | /api/dialings/:id(.:format)                                      |
|                             | PUT    | /api/dialings/:id(.:format)                                      |
|                             | DELETE | /api/dialings/:id(.:format)                                      |
|                             | GET    | /api/metrics_entry_exit/:id(.:format)                            |
| metrics_late_employees      | GET   | /api/metrics_late_employees(.:format)                             |
| metrics_overtime_employees  | GET    | /api/metrics_overtime_employees(.:format)                        |


