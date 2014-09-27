# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Status.create(name: 'Waiting for staff response', initial: true, holding: false, closing: false)
Status.create(name: 'Waiting for customer', initial: false, holding: false, closing: false)
Status.create(name: 'On hold', initial: false, holding: true, closing: false)
Status.create(name: 'Cancelled', initial: false, holding: false, closing: true)
Status.create(name: 'Completed', initial: false, holding: false, closing: true)
