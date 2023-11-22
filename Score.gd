extends CanvasLayer

var value : int = 0
var label : Label  # Declare the variable with the Label type

func _ready():
	# Use find_node to locate the Label child
	label = $Label if $Label else null

	if label:
		# Initialize the label if found
		update_score_label()
	else:
		print("Label node not found in CanvasLayer.")
		
func _process(delta):
	update_score_label()

func update_score_label():
	if label:
		label.text = "Score: " + str(value)
	else:
		print("Label node is null.")
