class_name Item
extends Resource

@export var id: String
@export var name: String
@export var count: int = 1
@export var weight: int = 1

@export_enum("material", "equipment", "ingredient", "food", "potion") var type: String

@export var recipe: Array[Item] = []

@export var price: int = 1
@export var price_change: float = 0.1
@export var price_change_total: float = 0.0
