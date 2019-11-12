extends RigidBody2D

export var maxspeed = 300

signal lives
signal score

var _decay_rate = 0.8

var _start_size
var _start_position
var _trauma = 0.0
var _rotation = 0
var _rotation_speed = 0.05
var _color = 0.0
var _color_decay = 1
var _normal_color
#None of the above stuff worked. I think it's because my tiles are sprites
func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 #_start_position = $ColorRect.rect_position
 #_normal_color = $ColorRect.color
 var WorldNode = get_node("/root/World")
 connect("score", WorldNode, "increase_score")
 connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tiles"):
   emit_signal("score",body.score)
   body.queue_free()
  if body.get_name() == "Paddle":
   pass
  
 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()

func add_trauma(amount):
	_trauma = min(_trauma + amount,1)

func _decay_trauma(delta):
	var change = _decay_rate + delta
	_trauma = max(_trauma + change,0)