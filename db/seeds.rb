# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


formulas = [
{nombre: 'Huevos con jamon', tiempo: '15 mins', tipo: 'Desayuno',descripcion: "...."},
{nombre: 'Milanesas empanizadas', tiempo: '40 mins', tipo: 'Comida',descripcion: "...."},
{nombre: 'Jugo verde', tiempo: '10 mins', tipo: 'Desayuno',descripcion: "...."},
{nombre: 'Molletes', tiempo: '20 mins', tipo: 'Almuerzo',descripcion: "...."},
{nombre: 'Sandwich', tiempo: '10 mins', tipo: 'Desayuno',descripcion: "...."}
]

ingredients = [
{nombre: "Huevos"},
{nombre: "jamon"},
{nombre: "pollo"},
{nombre: "pan molido"},
{nombre: "agua"},
{nombre: "apio"},
{nombre: "kiwi"},
{nombre: "frijoles"},
{nombre: "bolillo"},
{nombre: "queso oaxaca"},
{nombre: "aguacate"},
{nombre: "pan caja"},
{nombre: "mayonesa"},
{nombre: "jitomate"},
{nombre: "lechuga"}
]

portions = [
{formula_id:1 ,ingredient_id: 1},
{formula_id:1 ,ingredient_id: 2},
{formula_id:2 ,ingredient_id: 3},
{formula_id:2 ,ingredient_id: 4},
{formula_id:3 ,ingredient_id: 5},
] 

formulas.each {|receta| Formula.create receta}
ingredients.each {|ingredientes| Ingredient.create ingredientes}
portions.each {|porciones| Portion.create porciones}
