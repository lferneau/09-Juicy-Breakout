extends Camera2D

var _decay_rate = 0.4
var _max_offset = 20

var _start_position
var _trauma

func _ready():
	_start_position = position
	_trauma = 0.0
	
func add_trauma(amount):
	_trauma = min(_trauma + amount, 1)
#I got really confused