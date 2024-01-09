extends ColorRect

var sceneLoader

# Called when the node enters the scene tree for the first time.
func _ready():
	SilentWolf.configure({
		"api_key": "0ZwVwhbQhm5VhfbXw1Wqw3dd3tTKOjhI2Kn0hK9d",
		"game_id": "balloon-game",
		"log_level": 0
 	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "main_menu.tscn"
 	})
	sceneLoader = $"/root/SceneLoader"
	
func changeToMainScene(): #the Timer node calls this function automatically after it has timed out
	sceneLoader.changeToScene("main_menu.tscn")
