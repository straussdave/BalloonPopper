extends CanvasLayer

var value : int = 0
var label : RichTextLabel
var shots : int = 0
var missedShots : int = 0
var hitShots : int = 0

func _ready():
	label = $ScoreLabel if $ScoreLabel else null
	self.visible = false
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
