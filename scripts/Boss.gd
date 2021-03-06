extends KinematicBody2D

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		get_parent().speed = -200
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		get_parent().speed = 200
