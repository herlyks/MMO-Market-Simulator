extends TabBar

@onready var table = %MaterialGridContainer


func _ready() -> void:
	Player.inventory_changed.connect(draw_inventory)
	draw_inventory()


func draw_inventory():
	for child in table.get_children():
		child.queue_free()
	
	table.columns = 4
	
	var name_header = Label.new()
	var count_header = Label.new()
	var weight_header = Label.new()
	var price_header = Label.new()
	
	name_header.text = "Name"
	count_header.text = "Count"
	weight_header.text = "Weight"
	price_header.text = "Price"
	
	table.add_child(name_header)
	table.add_child(count_header)
	table.add_child(weight_header)
	table.add_child(price_header)
	
	for item in Player.get_inventory():
		var name = Label.new()
		var count = Label.new()
		var weight = Label.new()
		var price = Label.new()
		
		name.text = item.name
		count.text = str(item.count)
		weight.text = str(item.weight)
		price.text = str(item.price)
		
		table.add_child(name)
		table.add_child(count)
		table.add_child(weight)
		table.add_child(price)
