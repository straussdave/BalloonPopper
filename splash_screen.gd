extends ColorRect

var sceneLoader

# Called when the node enters the scene tree for the first time.
func _ready():
	sceneLoader = $"/root/SceneLoader"
	
func changeToMainScene(): #the Timer node calls this function automatically after it has timed out
	sceneLoader.changeToScene("main_menu.tscn")
