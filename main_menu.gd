extends ColorRect

var sceneLoader

# Called when the node enters the scene tree for the first time.
func _ready():
	sceneLoader = $"/root/SceneLoader"
	
func changeToGameScene(): #connected to play button press event to this function
	sceneLoader.changeToScene("MainScene.tscn")
	
func quit():
	get_tree().quit()
