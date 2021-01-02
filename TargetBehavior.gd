extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	connect('body_entered', self, '_on_body_entered')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	#var b = get_colliding_bodies()
	pass

func _on_body_entered(body):
	print(body)
	
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
	
	# TODO: Possible to manage this from another
	# class?
