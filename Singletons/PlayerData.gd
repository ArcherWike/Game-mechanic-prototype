extends Node


#func _ready():
#	item_data = LoadData("res://Data/ItemData.json")
var FILE_NAME: String = "res://Saves/PlayerState.txt"
	
var player = {
	"name": "Lauren",
	"score": 0,
	"level": 1,
	"high_score": {
		"value": 0,
		"date": ""
	}
}	
	
	
	
func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			player = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")


func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(player))
	file.close()
