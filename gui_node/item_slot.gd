
extends Button

# member variables here, example:
# var a=2
# var b="textvar"
var count_text
var count_num
export(int) var slot_id
export(int) var item_id
var item_data
var invent_sys
var timer
onready var split_item = false
var detail

func _ready():
	timer = get_parent().get_parent().get_node("Timer")
	invent_sys = get_parent().get_parent()
	item_data = get_node("ItemData")
	count_text = get_node("count_text")
	### set deail from item_data
	detail = get_node("detail")
	item_id = 0
	count_num = 0
	connect("mouse_enter", self, "_mouse_enter")
	connect("mouse_exit", self, "_mouse_exit")
	set_fixed_process(true)
	
func _fixed_process(delta):
	refresh()
		
func refresh():
	set_button_icon(item_data.get_item_image(item_id))
	if count_num == 0:
		item_id = 0
	if count_num > 1:
		count_text.set_text(str(count_num))
	else:
		count_text.set_text("")
	### split item timer
	if split_item == true:
		timer.set_wait_time(0.1)
		if timer.get_time_left() <= 0:
			if count_num > 0:
				invent_sys.item_picking.count_num += 1
				count_num -= 1
				timer.start()
	### refresh detail
	get_node("detail/v/name").set_text(str(item_data.get_item_name(item_id)))
	get_node("detail/v/hp").set_text("HP : "+str(item_data.get_item_hp(item_id)))
	get_node("detail/v/mp").set_text("MP : "+str(item_data.get_item_mp(item_id)))
	get_node("detail/v/atk").set_text("Attack : "+str(item_data.get_item_attack(item_id)))
	get_node("detail/v/speed").set_text("Speed : "+str(item_data.get_item_speed(item_id)))
	get_node("detail/v/def").set_text("Defend : "+str(item_data.get_item_defend(item_id)))
	get_node("detail/v/cost").set_text("Cost : "+str(item_data.get_item_cost(item_id)))

func _input_event(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.is_action_pressed("left_click"):
			if item_id != 0:
				if item_id == invent_sys.item_picking.item_id:
					if item_data.get_can_store(item_id) :
						count_num += invent_sys.item_picking.count_num
						invent_sys.item_picking.item_id = 0
						invent_sys.item_picking.count_num = 0
				elif invent_sys.item_picking.item_id == 0:
					invent_sys.item_picking.item_id = item_id
					invent_sys.item_picking.count_num = count_num
					count_num = 0
					item_id = 0
				elif item_id != invent_sys.item_picking.item_id and invent_sys.item_picking.item_id != 0:
					var tmp_item_id = invent_sys.item_picking.item_id
					var tmp_count_num = invent_sys.item_picking.count_num
					invent_sys.item_picking.item_id = item_id
					invent_sys.item_picking.count_num = count_num
					item_id = tmp_item_id
					count_num = tmp_count_num
			elif item_id == 0:
				item_id = invent_sys.item_picking.item_id
				count_num = invent_sys.item_picking.count_num
				invent_sys.item_picking.item_id = 0
				invent_sys.item_picking.count_num = 0
		elif event.is_action_pressed("right_click"):
			if invent_sys.item_picking.item_id == 0:
				invent_sys.item_picking.item_id = item_id
				invent_sys.item_picking.count_num += 1
				count_num -= 1
				timer.set_wait_time(0.5)
				timer.start()
				split_item = true
			elif invent_sys.item_picking.item_id == item_id:
				if item_data.get_can_store(item_id):
					invent_sys.item_picking.item_id = item_id
					invent_sys.item_picking.count_num += 1
					count_num -= 1
					timer.set_wait_time(0.5)
					timer.start()
					split_item = true
			elif count_num == 0 and invent_sys.item_picking.count_num > 0:
				item_id = invent_sys.item_picking.item_id
				count_num += 1
				invent_sys.item_picking.count_num -= 1
		elif event.is_action_released("right_click"):
			split_item = false
	if event.type == InputEvent.MOUSE_MOTION:
		var m = get_viewport().get_mouse_pos()
		detail.set_pos(Vector2(m.x+55, m.y+10))
		
func _mouse_enter():
	if item_id != 0:
		detail.set_as_toplevel(true)
		detail.show()
	
func _mouse_exit():
	detail.set_as_toplevel(false)
	detail.hide()
	