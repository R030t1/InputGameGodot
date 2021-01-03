extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var pscene = load('res://Player.tscn')
	var player = pscene.instance()
	
	var cscene = load('res://Carny.tscn')
	var carney = cscene.instance()
	
	add_child(player)
	add_child(carney)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
