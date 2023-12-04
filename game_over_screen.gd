extends VBoxContainer

var accuracyLabel
var scoreLabel
var score
var accuracy

var sceneLoader

# Called when the node enters the scene tree for the first time.
func _ready():
	sceneLoader = $"/root/SceneLoader"
	score =  $"/root/Score"
	scoreLabel = $Score
	accuracyLabel = $Accuracy
	scoreLabel.append_text(str(score.value))
	var intAccuracy : int = calculateAccuracy() * 100
	accuracyLabel.append_text(str(intAccuracy) + '%')
	
func calculateAccuracy():
	if(score.shots == 0):
		return 0
	var accuracy : float
	accuracy = float(score.hitShots) / float(score.shots)
	return accuracy
	
func changeToGameScene(): #connected to play button press event to this function
	sceneLoader.changeToScene("MainScene.tscn")
	
func quit():
	get_tree().quit()
	
