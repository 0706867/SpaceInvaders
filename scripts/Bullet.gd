extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVars.bulletInstanceCount += 1
	set_physics_process(true)



func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed*delta))
	if (collidedObject):
		#print(collidedObject.collider.name)
		#if collidedObject.is_in_group("enemy"):
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			GlobalVars.score +=1;
		queue_free()
		GlobalVars.bulletInstanceCount -= 1
		
	
