extends Node

const ITEM_ID = 0
const ITEM_NAME = 1
const ITEM_HP = 2
const ITEM_MP = 3
const ITEM_ATTACK = 4
const ITEM_SPEED = 5
const ITEM_DEFEND = 6
const ITEM_COST = 7
const ITEM_IMAGE = 8
const ITEM_MODEL = 9
#can_store 0 = YES, 1 = NO
const CAN_STORE = 10

var item_database = [
	{ITEM_ID : 0, ITEM_NAME : "Empty", ITEM_HP : 0, ITEM_MP : 0, ITEM_ATTACK : 10, ITEM_SPEED : 0, ITEM_DEFEND : 0, ITEM_COST : 0, ITEM_IMAGE : "res://Textures/icon_empty.tex", ITEM_MODEL : "res://3d_scene/Empty.tscn", CAN_STORE : true},
	{ITEM_ID : 1, ITEM_NAME : "Hoe", ITEM_HP : 0, ITEM_MP : 0, ITEM_ATTACK : 30, ITEM_SPEED : 0, ITEM_DEFEND : 0, ITEM_COST : 500, ITEM_IMAGE : "res://Textures/icon_hoe.tex", ITEM_MODEL : "res://3d_scene/hoe.scn", CAN_STORE : false},
	{ITEM_ID : 2, ITEM_NAME : "Axe", ITEM_HP : 0, ITEM_MP : 0, ITEM_ATTACK : 50, ITEM_SPEED : 0, ITEM_DEFEND : 0, ITEM_COST : 500, ITEM_IMAGE : "res://Textures/icon_axe.tex", ITEM_MODEL : "res://3d_scene/axe.scn", CAN_STORE : false},
	{ITEM_ID : 3, ITEM_NAME : "Wood", ITEM_HP : 0, ITEM_MP : 0, ITEM_ATTACK : 10, ITEM_SPEED : 0, ITEM_DEFEND : 0, ITEM_COST : 50, ITEM_IMAGE : "res://Textures/icon_wood.tex", ITEM_MODEL : "res://3d_scene/trunk.scn", CAN_STORE : true},
	{ITEM_ID : 4, ITEM_NAME : "Torch", ITEM_HP : 0, ITEM_MP : 0, ITEM_ATTACK : 10, ITEM_SPEED : 0, ITEM_DEFEND : 0, ITEM_COST : 500, ITEM_IMAGE : "res://Textures/icon_torch.tex", ITEM_MODEL : "res://3d_scene/torch.scn", CAN_STORE : false},
]

func get_item_id(i):
	return item_database[i][ITEM_ID]

func get_item_name(i):
	return item_database[i][ITEM_NAME]

func get_item_hp(i):
	return item_database[i][ITEM_HP]

func get_item_mp(i):
	return item_database[i][ITEM_MP]

func get_item_attack(i):
	return item_database[i][ITEM_ATTACK]

func get_item_speed(i):
	return item_database[i][ITEM_SPEED]

func get_item_defend(i):
	return item_database[i][ITEM_DEFEND]
	
func get_item_cost(i):
	return item_database[i][ITEM_COST]
	
func get_item_image(i):
	var image = load(item_database[i][ITEM_IMAGE])
	return image
	
func get_item_model(i):
	var model = load(item_database[i][ITEM_MODEL])
	return model.instance()

func get_can_store(i):
	return item_database[i][CAN_STORE]