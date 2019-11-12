extends Label

func _ready():
 update_score()

func update_score():
 text = "GOOD BOY POINTS: " + str(get_parent().score)