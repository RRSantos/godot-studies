extends Button


const MAX_SCALE:float = 1.0
const MIN_SCALE:float = 0.95

var multiplier:float

func _process(delta: float):
	 
	if rect_scale.x >=  MAX_SCALE:
		multiplier = -0.1
		
	if rect_scale.x < MIN_SCALE:
		multiplier = 0.3
		
	rect_scale.x +=  multiplier * delta
	rect_scale.y +=  multiplier * delta
	
