extends Node2D

@export var radius : float = 1;

func _ready():
	# Hide the system cursor when the game starts
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	z_index = 3
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.scale = (Vector2(radius, radius))
	# Get the global position of the mouse cursor
	var mouse_position = get_global_mouse_position()

	# Set the crosshair position to the mouse position
	position = mouse_position

