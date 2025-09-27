extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = 800
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
			$AnimatedSprite.play("jump")
	
	motion = move_and_slide(motion, UP)
	pass


func _on_enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://game over.tscn")
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
