extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Could possibly hook events to second object
	# that manages game state.
	connect('body_entered', self, '_on_body_entered')
	connect('input_event', self, '_on_input_event')
	self.input_pickable = true

# Strike me down and I shall return more powerful than
# you could possibly imagine!
func die():
	# TODO: Possible to manage this from another
	# class?
	var tscene = load('res://Target.tscn')
	var target = tscene.instance()
	target.position = Vector2(
		rand_range(0, 300),
		rand_range(0, 300)
	)
	# Add new target.
	get_tree().get_root().add_child(target)
	# Remove current target.
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _integrate_forces(_state):
	#var b = get_colliding_bodies()
	pass

func _on_body_entered(body):
	die()

func _on_input_event(camera: Node, event: InputEvent, shape: int):
	if not event is InputEventMouseButton:
		return
	die()
