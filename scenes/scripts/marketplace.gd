extends TabBar

@onready var table = %MarketplaceGridContainer
@onready var gold_label = %GoldLabel

var items = ItemLoader.load_marketplace_items()


func _ready() -> void:
	refresh()


#func _process(delta: float) -> void:
	#refresh()


func refresh():
	var player_inventory = Player.get_inventory()
	
	gold_label.text = str("Money : ", Player.money, " G")
	
	for child in table.get_children():
		child.queue_free()
	
	table.columns = 5
	
	var name_header = Label.new()
	var price_header = Label.new()
	var price_change_header = Label.new()
	var btn_buy_header = Label.new()
	var btn_sell_header = Label.new()
	
	name_header.text = "Name"
	price_header.text = "Price"
	price_change_header.text = "Price Change"
	
	table.add_child(name_header)
	table.add_child(price_header)
	table.add_child(price_change_header)
	table.add_child(btn_buy_header)
	table.add_child(btn_sell_header)
	
	for item in items:
		var new_price = item.price + roundf(item.price_change_total)
		
		var name = Label.new()
		var price = Label.new()
		var price_change = Label.new()
		var btn_buy = Button.new()
		var btn_sell = Button.new()
		
		name.text = item.name
		price.text = str(new_price)
		price_change.text = str(item.price_change_total)
		btn_buy.text = "Buy"
		btn_sell.text = "Sell"
		
		if Player.money < new_price:
			btn_buy.disabled = true
		
		if player_has_item(item) == false:
			btn_sell.disabled = true
		
		btn_buy.pressed.connect(func():
			Player.money -= new_price
			Player.add_item(item.duplicate())
			item.price_change_total += item.price_change
			refresh()
		)
		
		btn_sell.pressed.connect(func():
			Player.money += new_price
			Player.remove_item(item.duplicate())
			item.price_change_total -= item.price_change
			refresh()
		)
		
		table.add_child(name)
		table.add_child(price)
		table.add_child(price_change)
		table.add_child(btn_buy)
		table.add_child(btn_sell)


func _on_refresh_button_pressed() -> void:
	refresh()


func player_has_item(item):
	var player_items = Player.get_inventory().filter(func(a): return item.id == a.id)
	
	if player_items.size() == 0:
		return false
	
	return true
