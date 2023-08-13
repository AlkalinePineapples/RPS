extends CharacterBody2D

const ACCEL = 1000
const MAXSPEED = 250.0
const MAXFALL = 200
const FRICTION = 1500
const JUMP_VELOCITY = -570.0
var gravity = 980
var gravitymultiplier = 0.3
var incontrol = false

func _physics_process(delta):
	if incontrol == true:
		if Input.is_action_just_pressed("UP"):
			if is_on_floor():
				velocity.y = JUMP_VELOCITY
			elif not $CoyoteTimer.is_stopped():
				velocity.y = JUMP_VELOCITY
		var direction = Input.get_axis("LEFT", "RIGHT")
		if direction:
			velocity.x = move_toward(velocity.x, direction * MAXSPEED, ACCEL * delta)
		else:
			velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
	if not is_on_floor():
		if velocity.y < 0:
			velocity.y += gravity * delta
		else:
			velocity.y = move_toward(velocity.y, MAXFALL, gravity * gravitymultiplier * delta)
	
	var was_on_floor = is_on_floor()
	
	move_and_slide()
	
	if was_on_floor and not is_on_floor():
		$CoyoteTimer.start()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("Character"):
			if incontrol == true:
				collision.get_collider().slide(-collision.get_normal() * (MAXSPEED/4))
		

func slide(vector):
	velocity.x = vector.x
