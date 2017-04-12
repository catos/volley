# https://github.com/gokudomatic/godot/blob/master/demos/2d/fox2d/source/player.gd

extends KinematicBody2D

const GRAVITY = 700.0
const WALK_MAX_SPEED = 300
const WALK_FORCE = 600

var velocity= Vector2()   # current velocity of the player

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	
	
	var gravityFactor = 1
	var xSpeedFactor = 1
	
	# will be the force applied to move the player
	var force = Vector2(0,GRAVITY*gravityFactor)
	
	if (Input.is_action_pressed("player1_left")):
		print(str("left"))
		if (velocity.x <= 0 and velocity.x > -WALK_MAX_SPEED*xSpeedFactor):
			force.x-=WALK_FORCE
	elif (Input.is_action_pressed("player1_right")):
		if (velocity.x>=0 and velocity.x < WALK_MAX_SPEED*xSpeedFactor):
			force.x+=WALK_FORCE
	
	#integrate forces to velocity
	velocity += force * delta
	
	#integrate velocity into motion and move
	var motion = velocity * delta
	
	#move and consume motion
	motion = move(motion)
	