extends Area2D

var tscene = null
var target = null

func _ready():
	tscene = load('res://Target.tscn')
	reset()
	
	connect('input_event', self, '_on_input_event')
	input_pickable = true
	
	get_tree().get_root().connect('size_changed', self, '_on_size_changed')
	resize()
	
func resize():
	var ww = get_tree().get_root().size.x
	var wh = get_tree().get_root().size.y
	position = Vector2(ww / 2, wh / 2)
	$CarneyCollisionShape.shape.extents = \
		Vector2(ww, wh)

func reset():
	if target:
		target.queue_free()
	target = tscene.instance()
	target.position = Vector2(
		rand_range(-position.x, position.x),
		rand_range(-position.y, position.y)
	)
	target.connect('hit', self, '_on_target_hit')
	add_child(target)

func _on_target_hit():
	# Need to tabulate hit here, as reset is called on other events.
	reset()

# Could be another logging class, but we use the window information.
func _on_input_event(camera: Node, event: InputEvent, shape: int):
	print(event)
	
func _on_size_changed():
	resize()
	reset()
