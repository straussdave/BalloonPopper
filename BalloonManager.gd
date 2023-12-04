extends Node2D

@export var balloon_spawn_timer : float

var balloon_scene = preload("res://Balloon.tscn")
var score_scene = preload("res://score.tscn")
var spawn_timer = balloon_spawn_timer
@onready var pop_sound = $PopSound
var deltaTime;
var lifes = 3;
var crosshair

var score
var counter = 0
var sceneLoader

# Variable to control the speed increase over time
var speed_increase_factor = 1.5

func _process(delta):
	deltaTime = delta;
	handle_balloon_spawns(delta)

func _ready():
	score = $"/root/Score"
	crosshair = $"/root/Crosshair"
	sceneLoader = $"/root/SceneLoader"
	spawn_timer += 0.5
	score.value = 0
	score.hitShots = 0
	score.missedShots = 0
	score.visible = true

func _on_balloon_left_screen():
	subtract_score()
	lose_life()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		handle_shot()

func handle_balloon_spawns(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_balloon()
		spawn_timer = balloon_spawn_timer

func spawn_balloon():
	# Instantiate a balloon at a random X position at the bottom of the screen
	var balloon_instance = balloon_scene.instantiate()
	balloon_instance.position.x = randf_range(get_viewport_rect().size.x / 10, get_viewport_rect().size.x - get_viewport_rect().size.x / 10)
	balloon_instance.position.y = get_viewport_rect().size.y + 100
	balloon_instance.name = "Balloon" + str(counter)
	# Increase the speed of the balloon based on the counter
	balloon_instance.speed = randf_range(balloon_instance.balloon_speed_min, balloon_instance.balloon_speed_max) + counter * speed_increase_factor
	add_child(balloon_instance)
	counter += 1
	balloon_instance.connect("balloon_left_screen", _on_balloon_left_screen)

func handle_shot():
	score.shots += 1
	var hit = false;
	for _i in self.get_children():
		if ("Balloon" in _i.name):
			if (check_overlap(crosshair.position, crosshair.radius, _i)):
				destroy_balloon(_i)
				add_score()
				hit = true;
	if(hit == false):
		subtract_score()

func check_overlap(coord1, radius1, balloon):
	var coord2 = balloon.position
	var x1 = coord1.x
	var y1 = coord1.y
	var x2 = coord2.x
	var y2 = coord2.y

	# Calculate the distance between the two points
	var distance = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))

	# Calculate the sum of the radii
	var sum_of_radii = radius1 + balloon.radius

	# Check if the circles overlap
	return distance <= sum_of_radii

func destroy_balloon(balloon):
	pop_sound.play()
	balloon.handleDeath()

func add_score():
	score.value += 1
	score.hitShots += 1

func subtract_score():
	score.value -= 1
	score.missedShots += 1

func lose_life():
	lifes = lifes - 1
	if(lifes <= 0):
		handle_lose()

func handle_lose():
	score.visible = false
	sceneLoader.changeToScene("game_over.tscn")
