extends Control

var enemies

func _ready():
	enemies = get_tree().get_nodes_in_group("enemy")
	print(enemies)
	GlobalVars.bulletInstanceCount = 0 # Keeps track of how many bullet instances are current
	GlobalVars.complaints = 0
	GlobalVars.score = 0
	GlobalVars.enemys = 500
	GlobalVars.enemyins = 0
	for button in $HUD.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	#colliding(true)

func colliding(area):
	if area.is_in_group("kill"):
		print("hi")
	pass

func _on_Button_pressed(scene_to_load):
	print("main Game here")
	get_tree().change_scene(scene_to_load)

