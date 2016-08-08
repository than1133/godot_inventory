
extends Button

var count_text
var count_num
var item_data
var item_id

func _ready():
	item_data = get_node("ItemData")
	count_text = get_node("label")
	count_num = 0
	item_id = 0
	set_fixed_process(true)
	
	
func _fixed_process(delta):
	#print(str(count_num))
	refresh()
	if count_num > 1:
		count_text.set_text(str(count_num))
	else:
		count_text.set_text("")

	
func refresh():
	var m = get_viewport().get_mouse_pos()
	set_pos(Vector2(m.x+10, m.y+10))
	set_button_icon(item_data.get_item_image(item_id))
	show_hide()
	
func show_hide():
	if count_num == 0:
		item_id = 0
		hide()
	else:
		show()


