extends Button


const MAX_SCALE = 1
const MIN_SCALE = 0.9

var multiplier = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	 
	if rect_scale.x >  MAX_SCALE:
		multiplier = -0.2
		
	if rect_scale.x <  MIN_SCALE:
		multiplier = 0.5
		
	rect_scale.x +=  multiplier * delta
	rect_scale.y +=  multiplier * delta
	
