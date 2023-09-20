extends KinematicBody2D

const SPEED = 128
const FLOOR = Vector2(0, -1)
const GRAVITY = 16
const JUMP_HEIGTH = 384
const BOUNCING_JUMP = 122
const CAST_WALL = 10
onready var motion : Vector2 = Vector2.ZERO
var can_move : bool

func _process(_delta):
	motion_crlt()

func get_axis() -> Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	return axis
	
func motion_crlt():
	motion.y += GRAVITY
	
	if can_move:
		if get_axis().x == 1:
			$RayCast.cast_to.y = CAST_WALL
			$AnimatedSprite.flip_h = false
		elif get_axis().x == -1:
			$AnimatedSprite.flip_h = true
			$RayCast.cast_to.y = -CAST_WALL
		
		if get_axis().x != 0 :
			motion.x = get_axis().x * SPEED
		else:
			motion.x = 0
	
	if is_on_floor():
		can_move = true
		
		if get_axis().x != 0:
			$AnimatedSprite.play("Run")
			$Particles.emitting = true
		else:
			$AnimatedSprite.play("Idle")
			$particles.emitting = false
		
		if Input.is_action_pressed("ui_accept"):
			$Jump.play()
			motion.y  -= JUMP_HEIGTH
			
	else:
		$particles.emitting = false
		
		if motion. y < 0:
			$AnimatedSprite.play("Jump")
		else:
			$AnimatedSprite.play("Fall")
		
		if $RayCast.is_colliding():
			can_move = false
			
			var col = $RayCast.get_collider()
			#https://www.youtube.com/watch?v=ytgVm4FMFRw&ab_channel=LeedeoStudio
			if col.is_in_
	
	motion = move_and_slide(motion, FLOOR)
				
	
			
		 
