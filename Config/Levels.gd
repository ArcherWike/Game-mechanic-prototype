extends Node2D

onready var Level_name_intro = preload("res://Config/UI/LevelNameIntro.tscn")
onready var Interface = preload("res://Config/UI/Interface.tscn")

func _ready():
	Globals.current_scene = self.name
	var level_name = Level_name_intro.instance()
	add_child(level_name)
	var interface_scene = Interface.instance()
	add_child(interface_scene)
