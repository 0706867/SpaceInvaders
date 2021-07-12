extends Label

func _ready():
	_process(true)

func _process(delta):
	set_text("Score: " + str(GlobalVars.score))
	pass
