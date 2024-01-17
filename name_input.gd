extends ColorRect

var sceneLoader
var globals
var line_edit : LineEdit

func _ready():
	sceneLoader = $"/root/SceneLoader"
	globals = $"/root/Globals"
	
func saveNameButtonPressed():
	line_edit = $"./CenterContainer/VBoxContainer/LineEdit"
	globals.playerName = line_edit.text
	print(globals.playerName)
	sceneLoader.changeToScene("main_menu.tscn")
