extends Node2D

var speed = -GlobalVars.enemys
func _ready():
	set_physics_process(true)
	global_position.y =0
	
	
func _physics_process(delta):
	GlobalVars.enemyy = global_position.y
	global_position.x += speed * delta
	if(global_position.y >= 520):
		for enemy in get_tree().get_nodes_in_group("enemy"):
			enemy.queue_free()
		get_tree().change_scene("res://scenes/EndGame.tscn")
	
