extends RigidBody2D

# We can connect this object's body_entered and input_event signals
# directly to the Carny, but I guess it makes sense to compartmentalize
# hit detection.
signal hit

func _ready():
	connect('body_entered', self, '_on_body_entered')
	connect('input_event', self, '_on_input_event')
	self.input_pickable = true

func _on_body_entered(body):
	emit_signal('hit')

func _on_input_event(camera: Node, event: InputEvent, shape: int):
	if not event is InputEventMouseButton:
		return
	emit_signal('hit')
