extends KinematicBody2D

var speed = 200
var bullet = preload("res://scenes/Bullet.tscn")
var enemies = preload("res://scenes/EnemiesEZ.tscn")
var boss = preload("res://scenes/Enemies.tscn")
var timer = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	timer=0
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")


func _physics_process(delta):

	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))
		
func _process(delta):
	timer+=1*delta
	var enemyInstance = enemies.instance()
	var dist = GlobalVars.enemyy
	if Input.is_action_just_pressed("fire"):
		if GlobalVars.bulletInstanceCount <= 5:
			var bulletInstance = bullet.instance()
			bulletInstance.position = Vector2(position.x, position.y-30)
			get_tree().get_root().add_child(bulletInstance)
		GlobalVars.enemyy = 0
	
	if dist >= 200:
		enemyInstance.position = Vector2(20,0)
		get_tree().get_root().add_child(enemyInstance)
		GlobalVars.enemyins +=1
		GlobalVars.enemys += 10

	if GlobalVars.enemyins == 5:
		var enemyIns = boss.instance()
		enemyIns.position = Vector2(20,0)
		get_tree().get_root().add_child(enemyIns)
		GlobalVars.enemyins = 0;
		
		

func _colliding(area):
	if area.is_in_group("left"):
		position.x=50
	if area.is_in_group("right"):
		position.x=1230
	
func _not_colliding(area):
	pass
