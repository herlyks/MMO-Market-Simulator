class_name Item
extends Resource

@export var id: String
@export var name: String
@export var count: int = 1
@export var space: int = 1
@export var price: int = 1
@export var recipe: Array[Item] = []
@export var price_change: float = 0.1
@export var price_change_total: float = 0.0
