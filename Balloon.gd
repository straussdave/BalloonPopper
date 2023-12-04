extends CenterContainer

signal balloon_left_screen

var balloon_speed_min = 75
var balloon_speed_max = 250
var speed
@export var radius : float
var isDead = false;

@onready var anim = get_node("AnimationPlayer")

func _ready():
	z_index = 2 #allows the crosshair to appear in front of the balloons
	anim.connect("animation_finished", queueFree)
	anim.play("fly")

func _process(delta):
	# Move the balloon upwards
	position.y -= speed * delta
	if(isDead == true):
		handleDeath()

	# Check if the balloon is out of the screen
	if position.y < 0:
		balloon_left_screen.emit()
		queue_free()  # Remove the balloon when it's out of the screen
		
func handleDeath():
	radius = 0
	speed = speed / 3
	anim.play("pop")
	
func queueFree():
	queue_free()
