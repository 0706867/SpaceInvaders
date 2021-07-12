extends KinematicBody2D


func _ready():
	$Area2D.connect("area_entered", self, "_colliding")
#	_process(true)
	global_position.y = 0

func _colliding(area):
	if(get_tree().get_current_scene().get_name() != "res://scenes/game end.tscn"):
		if area.is_in_group("right"):
			get_parent().global_position.y += 100
			get_parent().speed = get_parent().speed*-1
		if area.is_in_group("left"):
			get_parent().global_position.y += 100
			get_parent().speed = get_parent().speed*-1

#func _process(delta):
#	if(global_position.y >= 535):
#		print (global_position.y)

