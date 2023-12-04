extends Node

func changeToScene(scene):
	get_tree().change_scene_to_file("res://" + scene)
