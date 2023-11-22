extends Node2D

var balloon_speed_min = 100
var balloon_speed_max = 350
var speed = randf_range(balloon_speed_min, balloon_speed_max)  # Adjust the speed of the balloon movement

@onready var anim = get_node("AnimationPlayer")

func _ready():
	z_index = -1
	anim.play("fly")



func _process(delta):
	# Move the balloon upwards
	position.y -= speed * delta

	# Check if the balloon is out of the screen
	if position.y < -get_viewport_rect().size.y / 2:
		queue_free()  # Remove the balloon when it's out of the screen
