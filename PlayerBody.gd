extends KinematicBody2D

export (int) var speed = 200 # px/s
var velocity = Vector2()
var acceleration = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func apply_input(delta):
	acceleration.y = Input.get_action_strength('down') - Input.get_action_strength('up')
	acceleration.x = Input.get_action_strength('right') - Input.get_action_strength('left')
	acceleration = acceleration.normalized()
	
	# Drag (deacceleration proportional to velocity).
	# px/s^2 -= 0.5 * px/s * s
	acceleration -= 40 * velocity.normalized() * delta

	# Decay, meant to mimic ground friction at low speeds.
	#velocity *= .98

	# Equations of motion.
	# px/s += 1000 * px/s^2 * s
	velocity += 1000 * acceleration * delta
	velocity = velocity.clamped(speed)
	
	# Equations are unstable near 0. No net movement,
	# but player body will jiggle. If drag is very high
	# magnitude can be close to 20 px/s.
	if (velocity.distance_to(Vector2(0, 0)) < 5):
		velocity = Vector2(0, 0)
	#print_debug(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_input(delta)
	velocity = move_and_slide(velocity)
