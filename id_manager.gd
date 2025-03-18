extends Node

#Id Manager

var uuid_pool = []
var unique_uuids = []

func get_id():
	var new_id: String
	if uuid_pool.size() > 0:
		new_id = uuid_pool.pop_front()
	else:
		new_id = create_id()
	return new_id

func create_id():
	var new_uuid = ""
	var chars = "abcdef0123456789"
	for i in range(32):
		if(i == 8 or i == 13 or i == 18 or i == 23):
			new_uuid += "-"
		else:
			new_uuid += chars[randi() % chars.length()]
	if new_uuid in unique_uuids:
		return create_id()
	else:
		unique_uuids.append(new_uuid)
		return new_uuid
	
