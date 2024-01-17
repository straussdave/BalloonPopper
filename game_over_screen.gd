extends VBoxContainer

var globals
var accuracyLabel
var scoreLabel
var score
var accuracy
var sceneLoader
var name_input

# Called when the node enters the scene tree for the first time.
func _ready():
	globals = $"/root/Globals"
	sceneLoader = $"/root/SceneLoader"
	score =  $"/root/Score"
	scoreLabel = $Score
	accuracyLabel = $Accuracy
	scoreLabel.append_text(str(score.value))
	var intAccuracy : int = calculateAccuracy() * 100
	accuracyLabel.append_text(str(intAccuracy) + '%')
	saveScoreToLeaderboard()
	
func calculateAccuracy():
	if(score.shots == 0):
		return 0
	var accuracy : float
	accuracy = float(score.hitShots) / float(score.shots)
	return accuracy
	
func changeToLeaderboardScene():
	sceneLoader.changeToScene("/addons/silent_wolf/Scores/Leaderboard.tscn")
	
func quit():
	get_tree().quit()
	
func saveScoreToLeaderboard():
	SilentWolf.Scores.save_score(globals.playerName, score.value)
