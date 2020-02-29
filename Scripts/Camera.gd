extends Camera2D


var decay_rate= 0.4
var max_offset = 10

var start_position 
var trama
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position
	trama = 0.0

func _process(delta):
	if trama > 0:
		decay_trama(delta)
		apply_shake()
		
func add_trama(amount):
	trama = min(trama + amount, 1)

func decay_trama(delta):
	var change = decay_rate * delta
	trama = max(trama - change, 0)

func apply_shake():
	var shake = trama * trama
	var o_x = max_offset * shake * get_np_scale()
	var o_y = max_offset * shake * get_np_scale()
	position = start_position + Vector2(o_x, o_y)
	
func get_np_scale():
	return rand_range(-1.0,1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
