# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


formulas = [
{nombre: 'Huevos con jamon', tiempo: '15 mins', tipo: 'Desayuno',descripcion: "...."			},
{nombre: 'Licuado de platano con fresa', tiempo: '15 mins', tipo: 'Desayuno',descripcion: "...."},
{nombre: 'Hot-cakes', tiempo: '15 mins', tipo: 'Desayuno',descripcion: "...."					},
{nombre: 'Torta cubana', tiempo: '15 mins', tipo: 'Comida',descripcion: "...."					},
{nombre: 'Milanesa de pollo', tiempo: '15 mins', tipo: 'Comida',descripcion: "...."				},
{nombre: 'Hot-dogs', tiempo: '15 mins', tipo: 'Aperitivo',descripcion: "...."					},
{nombre: 'Sandwich de jamon', tiempo: '15 mins', tipo: 'Desayuno',descripcion: "...."			},
{nombre: 'Crema de chayote', tiempo: '15 mins', tipo: 'Cremas',descripcion: "...."				},
{nombre: 'Enchiladas', tiempo: '15 mins', tipo: 'Comida',descripcion: "...."					},
{nombre: 'Chiles rellenos', tiempo: '15 mins', tipo: 'Comida',descripcion: "...."				}

]

ingredients = [
{nombre: "Huevo"		},
{nombre: "jamon"		},
{nombre: "aceite"		},
{nombre: "mantequilla"	},
{nombre: "leche"		},
{nombre: "platano"		},
{nombre: "fresa"		},
{nombre: "azucar"		},
{nombre: "harina"		},
{nombre: "pan"			},
{nombre: "aguacate"		},
{nombre: "bolillo"		},
{nombre: "mayonesa"		},
{nombre: "jitomate"		},
{nombre: "lechuga"		},
{nombre: "pan molido"	},
{nombre: "sal con ajo"	},
{nombre: "catsup"		},
{nombre: "chayote"		},
{nombre: "tortillas"	},
{nombre: "tomates"		},
{nombre: "queso canasto"},
{nombre: "Crema"		},
{nombre: "pollo"		},
{nombre: "chile poblano"},
{nombre: "salchica"		},
{nombre: "agua"			},
{nombre: "queso oaxaca"	}
]

portions = [
{formula_id:1 ,ingredient_id: 1},
{formula_id:1 ,ingredient_id: 2},
{formula_id:1 ,ingredient_id: 3},
{formula_id:1 ,ingredient_id: 4},
{formula_id:2 ,ingredient_id: 5},
{formula_id:2 ,ingredient_id: 6},
{formula_id:2 ,ingredient_id: 7},
{formula_id:2 ,ingredient_id: 8},
{formula_id:3 ,ingredient_id: 4},
{formula_id:3 ,ingredient_id: 5},
{formula_id:3 ,ingredient_id: 8},
{formula_id:3 ,ingredient_id: 9},
{formula_id:4 ,ingredient_id: 1},
{formula_id:4 ,ingredient_id: 2},
{formula_id:4 ,ingredient_id: 3},
{formula_id:4 ,ingredient_id: 11},
{formula_id:4 ,ingredient_id: 12},
{formula_id:4 ,ingredient_id: 13},
{formula_id:4 ,ingredient_id: 14},
{formula_id:4 ,ingredient_id: 15},
{formula_id:4 ,ingredient_id: 28},
{formula_id:5 ,ingredient_id: 3},
{formula_id:5 ,ingredient_id: 16},
{formula_id:5 ,ingredient_id: 17},
{formula_id:6 ,ingredient_id: 10},
{formula_id:6 ,ingredient_id: 14},
{formula_id:6 ,ingredient_id: 18},
{formula_id:6 ,ingredient_id: 13},
{formula_id:7 ,ingredient_id: 10},
{formula_id:7 ,ingredient_id: 2},
{formula_id:7 ,ingredient_id: 13},
{formula_id:7 ,ingredient_id: 15},
{formula_id:7 ,ingredient_id: 14},
{formula_id:8 ,ingredient_id: 27},
{formula_id:8 ,ingredient_id: 5},
{formula_id:8 ,ingredient_id: 9},
{formula_id:8 ,ingredient_id: 4},
{formula_id:9 ,ingredient_id: 20},
{formula_id:9 ,ingredient_id: 21},
{formula_id:9 ,ingredient_id: 23},
{formula_id:9 ,ingredient_id: 24},
{formula_id:9 ,ingredient_id: 22},
{formula_id:10 ,ingredient_id: 14},
{formula_id:10 ,ingredient_id: 25},
{formula_id:10 ,ingredient_id: 28},
{formula_id:10 ,ingredient_id: 3},
{formula_id:10 ,ingredient_id: 27}
] 

formulas.each {|receta| Formula.create receta}
ingredients.each {|ingredientes| Ingredient.create ingredientes}
portions.each {|porciones| Portion.create porciones}
