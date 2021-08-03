extends KinematicBody2D


export var speed: = Vector2(350.0, 900.0)
export var gravity: = 3500.0

var _velocity: = Vector2.ZERO

onready var animatedSprite = $AnimatedSprite
onready var _isDead = false

func die():
	_isDead = true
	animatedSprite.play("dead")

func _is_running():
	return Input.is_key_pressed(KEY_SHIFT)


func _get_animation(linear_velocity):
	var animation = ""
	if linear_velocity == Vector2.ZERO:
		animation = "idle"
	elif linear_velocity.x != 0:
		if _is_running():
			animation = "run"
		else:
			animation = "walk"
	elif linear_velocity.y < 0:
		animation = "jump"
		
	return animation

func _get_direction() -> Vector2:
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y = -Input.get_action_strength("ui_select") if is_on_floor() and Input.is_action_just_pressed("ui_select") else 0.0
	
	return Vector2(x, y)

func _calculate_move_velocity(linear_velocity: Vector2,direction: Vector2, speed: Vector2,is_jump_interrupted: bool) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x * (1.5 if _is_running() else 1)
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity

func _physics_process(delta):
	if not _isDead:
		var is_jump_interrupted: = Input.is_action_just_released("ui_select") and _velocity.y < 0.0
		
		var direction: = _get_direction()
		_velocity = _calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)	
		_velocity.y += gravity * delta
		
		if direction.x != 0:
			animatedSprite.flip_h = direction.x < 0	
		
		var animation = _get_animation(direction)
		animatedSprite.play(animation)
		
		_velocity = move_and_slide(_velocity, Vector2.UP)
