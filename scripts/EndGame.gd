extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $HUD.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])


func _on_Button_pressed(scene_to_load):
	print("end game here")
	get_tree().change_scene(scene_to_load)



# Add code , every second, update a label in the UI with an increased number.
