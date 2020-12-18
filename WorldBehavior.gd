extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var pscene = load('res://Player.tscn')
	var player = pscene.instance()
	
	var tscene = load('res://Target.tscn')
	var target = tscene.instance()
	
	target.position = Vector2(100, 100)
	
	add_child(player)
	add_child(target)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
