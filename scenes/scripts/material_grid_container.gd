extends GridContainer


func _process(delta: float) -> void:
	var table = self
	
	for child in table.get_children():
		child.queue_free()
	
	table.columns = 4
	
	var name_header = Label.new()
	var count_header = Label.new()
	var space_header = Label.new()
	var price_header = Label.new()
	
	name_header.text = "Name"
	count_header.text = "Count"
	space_header.text = "Space"
	price_header.text = "Price"
	
	table.add_child(name_header)
	table.add_child(count_header)
	table.add_child(space_header)
	table.add_child(price_header)
	
	for item in Player.get_inventory():
		var name = Label.new()
		var count = Label.new()
		var space = Label.new()
		var price = Label.new()
		
		name.text = item.name
		count.text = str(item.count)
		space.text = str(item.space)
		price.text = str(item.price)
		
		table.add_child(name)
		table.add_child(count)
		table.add_child(space)
		table.add_child(price)
