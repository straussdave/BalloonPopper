extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	getHighscores()

func getHighscores():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_result.scores))
