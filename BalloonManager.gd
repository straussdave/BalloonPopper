extends Node2D

@export var balloon_radius : float
@export var balloon_spawn_timer : float

var balloon_scene = preload("res://Balloon.tscn")
var spawn_timer = balloon_spawn_timer  # Adjust the timer to control balloon spawning frequency

func _process(delta):
	# Spawn balloons at random positions at the bottom of the screen
	handle_balloon_spawns(delta)
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handle_shot()
		
		
func handle_balloon_spawns(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_balloon()
		spawn_timer = balloon_spawn_timer  # Reset the timer after spawning a balloon
		
func spawn_balloon():
	# Instantiate a balloon at a random X position at the bottom of the screen
	var balloon_instance = balloon_scene.instantiate()
	balloon_instance.position.x = randf_range(-get_viewport_rect().size.x / 2, get_viewport_rect().size.x / 2)
	balloon_instance.position.y = get_viewport_rect().size.y / 2
	add_child(balloon_instance)
	
		
func handle_shot():
	var crosshair
	for _i in self.get_children():
		if(_i.name == "Crosshair"):
				crosshair = _i
		if(_i.name != "Crosshair"):
			if(check_overlap(crosshair.position, crosshair.radius, _i.position, balloon_radius)):
				destroy_balloon(_i)
	
func check_overlap(coord1, radius1, coord2, radius2):
	var x1 = coord1.x
	var y1 = coord1.y
	var x2 = coord2.x
	var y2 = coord2.y

	# Calculate the distance between the two points
	var distance = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))

	# Calculate the sum of the radii
	var sum_of_radii = radius1 + radius2

	# Check if the circles overlap
	return distance <= sum_of_radii

func destroy_balloon(balloon):
	balloon.speed = balloon.speed/3
	balloon.anim.play("pop") #automatically "frees" the balloon when it ended playing
