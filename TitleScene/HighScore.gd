extends Label

func _ready():
	_process(true)

func _process(delta):
	if GlobalVars.score >= GlobalVars.highscore :
		GlobalVars.highscore = GlobalVars.score
	set_text(str(GlobalVars.highscore))
	pass
