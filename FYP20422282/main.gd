extends Node3D
#inporting objects make array to fill with the objects
@export var outer_layer_food: PackedScene = null
var outer_layer_foods: Array[StaticBody3D] = []
@export var outer_layer_item: PackedScene = null
var outer_layer_items: Array[StaticBody3D] = []
@export var outer_layer_animal: PackedScene = null
var outer_layer_animals: Array[StaticBody3D] = []
@export var outer_layer_info: PackedScene = null
var outer_layer_infos: Array[StaticBody3D] = []
@export var cupcake: PackedScene = null
var cupcakes: Array[RigidBody3D] = []
@export var pizza: PackedScene = null
var pizzas: Array[RigidBody3D] = []
@export var burger: PackedScene = null
var burgers: Array[StaticBody3D] = []
@export var donut: PackedScene = null
var donuts: Array[RigidBody3D] = []
@export var icecream: PackedScene = null
var icecreams: Array[RigidBody3D] = []
@export var hotdog: PackedScene = null
var hotdogs: Array[RigidBody3D] = []
@export var soda: PackedScene = null
var sodas: Array[RigidBody3D] = []
@export var waffle: PackedScene = null
var waffles: Array[RigidBody3D] = []
@export var book: PackedScene = null
var books: Array[RigidBody3D] = []
@export var sword: PackedScene = null
var swords: Array[RigidBody3D] = []
@export var spawnBox: PackedScene = null
var spawnBoxs: Array[StaticBody3D] = []
var menu_instance 
@onready var menu: Node3D = get_node("Menu")
@onready var left_hand_node: Node3D = $Player/LeftHand
@onready var right_hand_node: Node3D = $Player/RightHand
@onready var spawnBoxlocation: StaticBody3D = $spawnBox
@onready var camera : Node3D = $Player/XRCamera3D2

# Variable to hold the object that will follow the hand
var follow_object: Node3D
var follow_object2: Node3D
var follow_object3: Node3D
var follow_object4: Node3D
var follow_object12: Node3D
var follow_object20: Node3D
var icube_instance: StaticBody3D
var icube2_instance: StaticBody3D
var icube3_instance: StaticBody3D
var icube4_instance: RigidBody3D
var icube12_instance: StaticBody3D
var icube20_instance: StaticBody3D

var interface : XRInterface
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("Works")
		get_viewport().use_xr = true
	
	outer_layer_foods = []
	outer_layer_items = []
	outer_layer_animals = []
	outer_layer_infos =[]
	cupcakes = []
	pizzas = []
	donuts = []
	icecreams = []
	hotdogs = []
	sodas = []
	waffles = []
	books = []
	spawnBoxs = []
	swords = []
	 # Set menu to the hand's location
	if left_hand_node:
		var hand_transform = left_hand_node.global_transform
		menu.global_transform = hand_transform
	else:
		print("left hand node not found in the scene.")

	 # Create the follow object or get a reference to it if it already exists in the scene
	#follow_object = outer_layer_food.instantiate()  # Example: instantiate your outer_layer_food scene
	#add_child(follow_object)  # Add it to the scene so we can set its position to follow the hand


# This function is called every frame because it's connected to the physics process
func _process(delta: float) -> void:
	# Check if the follow_object2 is valid and the hand node is available
	if left_hand_node and is_hand_facing_upwards(left_hand_node):
		#handle_menu_display() 
		menu.show()
		
		if is_instance_valid(follow_object2) and left_hand_node:
		
			var hand_position2 = left_hand_node.global_transform.origin
			follow_object2.show()
			var offset2 = Vector3(0, 0.3, 0) # Adjust this value as needed
			follow_object2.global_transform.origin = hand_position2 + offset2
			var camera_y_rotation = camera.global_transform.basis.get_euler().y
			var custom_scale = Vector3(0.5, 0.5, 0.5)
			follow_object2.scale = custom_scale
			var current_rotation = follow_object2.rotation_degrees
			follow_object2.rotation_degrees.x = 101.7
			follow_object2.rotation_degrees.y = rad_to_deg(camera_y_rotation)
			follow_object2.rotation_degrees.z = 0

		if is_instance_valid(follow_object20) and left_hand_node:
			var hand_position20 = left_hand_node.global_transform.origin
			follow_object20.show()
			var offset20 = Vector3(0, 0.3, 0) # Adjust this value as needed
			follow_object20.global_transform.origin = hand_position20 + offset20
			var camera_y_rotation = camera.global_transform.basis.get_euler().y
			var custom_scale = Vector3(0.5, 0.5, 0.5)
			follow_object20.scale = custom_scale
			var current_rotation = follow_object20.rotation_degrees
			follow_object20.rotation_degrees.x = 101.7
			follow_object20.rotation_degrees.y = rad_to_deg(camera_y_rotation)
			follow_object20.rotation_degrees.z = 0

		if is_instance_valid(follow_object) and left_hand_node:
			var hand_position = left_hand_node.global_transform.origin
			follow_object.show()
			var offset = Vector3(0, 0.3, 0) # Adjust this value as needed
			follow_object.global_transform.origin = hand_position + offset
			var camera_y_rotation = camera.global_transform.basis.get_euler().y
			var custom_scale = Vector3(0.5, 0.5, 0.5)
			follow_object.scale = custom_scale
			var current_rotation = follow_object.rotation_degrees
			follow_object.rotation_degrees.x = 101.7
			follow_object.rotation_degrees.y = rad_to_deg(camera_y_rotation)
			follow_object.rotation_degrees.z = 0

		if is_instance_valid(follow_object3) and left_hand_node:
			var hand_position3 = left_hand_node.global_transform.origin
			follow_object3.show()
			var offset3 = Vector3(0, 0.3, 0) # Adjust this value as needed
			follow_object3.global_transform.origin = hand_position3 + offset3
			var camera_y_rotation = camera.global_transform.basis.get_euler().y
			var custom_scale = Vector3(0.5, 0.5, 0.5)
			follow_object3.scale = custom_scale
			var current_rotation = follow_object3.rotation_degrees
			follow_object3.rotation_degrees.x = 101.7
			follow_object3.rotation_degrees.y = rad_to_deg(camera_y_rotation)
			follow_object3.rotation_degrees.z = 0

		if is_instance_valid(follow_object4) and right_hand_node:
			var hand_position4 = right_hand_node.global_transform.origin
			follow_object4.show()
		# Set the desired offset
			var offset4 = Vector3(0, 0.3, 0) # This will place the object 20cm above the hand
			follow_object4.global_transform.origin = hand_position4 + offset4

		if is_instance_valid(follow_object12) and left_hand_node:
			var hand_position12 = left_hand_node.global_transform.origin
			follow_object12.show()
		# Set the desired offset
			var offset12 = Vector3(0.35, 0.3, 0) # This will place the object 20cm above the hand
			follow_object12.global_transform.origin = hand_position12 + offset12

		if left_hand_node:
			var hand_position5 = left_hand_node.global_transform.origin
		# Set the desired offset
			var camera_y_rotation = camera.global_transform.basis.get_euler().y
			menu.rotation.y = camera_y_rotation
			var offset5 = Vector3(0, 0.1, 0) # This will place the object 20cm above the hand
			menu.global_transform.origin = hand_position5 + offset5
			
			menu.scale = Vector3(0.5, 0.5, 0.5)  # Adjust the scale as needed
			#menu.rotation.x = deg_to_rad(101.7)
			
			#menu.rotation.z = 0

	else:
		menu.hide()
		if is_instance_valid(follow_object2) and left_hand_node:
			follow_object2.hide()
		if is_instance_valid(follow_object20) and left_hand_node:
			follow_object20.hide()
		if is_instance_valid(follow_object) and left_hand_node:
			follow_object.hide()
		if is_instance_valid(follow_object3) and left_hand_node:
			follow_object3.hide()
		if is_instance_valid(follow_object4) and left_hand_node:
			follow_object4.hide()
		if is_instance_valid(follow_object12) and left_hand_node:
			follow_object12.hide
		return
	

func handle_menu_display() -> void:
	# Ensure the left_hand_node is valid
	if left_hand_node:
		var hand_up_vector = left_hand_node.global_transform.basis.y
		var world_up_vector = Vector3(0, 1, 0)
		var dot_product = hand_up_vector.dot(world_up_vector)
		
		# Check if the dot product is close to 1, meaning the hand is facing upwards
		if dot_product > 0.9:
			# Hand is facing upwards
			if not menu_instance or not menu_instance.is_inside_tree():
				menu_instance = menu.instantiate()
				menu_instance.scale = Vector3(0.5, 0.5, 0.5)
				add_child(menu_instance)
				# This positions the menu in front of the hand when it's instantiated
				menu_instance.global_transform = left_hand_node.global_transform.translated(Vector3(0, 0, -0.5))
		else:
			# Hand is not facing upwards
			if menu_instance and menu_instance.is_inside_tree():
				menu_instance.queue_free() # This removes the menu

func is_hand_facing_upwards(hand_node: Node3D) -> bool:
	# Check the hand's rotation to determine if it's facing upwards
	# This example checks if the pitch (rotation around X-axis) is within a certain range
	var pitch = hand_node.rotation_degrees.x
	return pitch > -10 and pitch < 10  # Adjust the range as needed based on your orientation system

func _spawn_object_to_hand(object_scene: PackedScene, hand_node: Node3D) -> void:
	var obj_instance: Node3D = object_scene.instantiate()
	obj_instance.transform = Transform3D() # Reset the local transform to default.
	hand_node.add_child(obj_instance) # Add as a child of the hand node.

func _delete_objects_from_array(objects_array: Array) -> void:
	for obj in objects_array:
		if obj.is_inside_tree():
			obj.queue_free()  # Schedule the object for deletion
	objects_array.clear()  # Clear the array after deleting the objects

func _spawn_outerLayer() -> void:# FOOD RING
	if not is_hand_facing_upwards(left_hand_node):
		return  # Exit the function if the hand is not facing upwards
	_delete_objects_from_array(outer_layer_items)
	_delete_objects_from_array(outer_layer_animals)
	_delete_objects_from_array(outer_layer_infos)
	#var menu_node_scale = $Menu.scale # Get the scale of the Menu node.
	if outer_layer_foods.size() < 20 :
		var icube: StaticBody3D = outer_layer_food.instantiate()
		var custom_scale = Vector3(0.5, 0.5, 0.5)
		icube.scale = custom_scale
		icube_instance = icube  # Store the reference to the instantiated object
		#icube.transform.origin = Vector3(0, 1.1, -1.12)
		print(icube.scale) # This should now print (0.5, 0.5, 0.5)
		var rotation_degrees = Vector3(101.7, 0, 0)
		var rotation_radians2 = rotation_degrees * PI / 180.0
		icube.rotation_degrees = rotation_degrees # Godot 4.x uses 'rotation_degrees' instead of 'rotation'
		add_child(icube)
		print(icube.scale)
		outer_layer_foods.append(icube)
	follow_object = icube_instance

func _spawn_outerLayer2() -> void:# ITEM RING
	_delete_objects_from_array(outer_layer_foods)
	_delete_objects_from_array(outer_layer_animals)
	_delete_objects_from_array(outer_layer_infos)
	if outer_layer_items.size() < 20 :
		var icube2: StaticBody3D = outer_layer_item.instantiate()
		#var custom_scale = Vector3(0.5, 0.5, 0.5)
		#icube2.scale = custom_scale
		icube2_instance = icube2  # Store the reference to the instantiated object
		#icube.transform.origin = Vector3(0, 1.1, -1.12)
		print(icube2.scale) # This should now print (0.5, 0.5, 0.5)
		#var rotation_degrees = Vector3(101.7, 0, 0)
		#var rotation_radians2 = rotation_degrees * PI / 180.0
		#icube2.rotation_degrees = rotation_degrees # Godot 4.x uses 'rotation_degrees' instead of 'rotation'
		add_child(icube2)
		print(icube2.scale)
		outer_layer_items.append(icube2)
	follow_object2 = icube2_instance

func _spawn_infoLayer() -> void:# INFO RING
	_delete_objects_from_array(outer_layer_foods)
	_delete_objects_from_array(outer_layer_animals)
	_delete_objects_from_array(outer_layer_items)
	if outer_layer_infos.size() < 20 :
		var icube20: StaticBody3D = outer_layer_info.instantiate()
		var custom_scale = Vector3(0.5, 0.5, 0.5)
		icube20.scale = custom_scale
		icube20_instance = icube20  # Store the reference to the instantiated object
		icube20.transform.origin = Vector3(0.5, 1.1, -1.12)
		print(icube20.scale) # This should now print (0.5, 0.5, 0.5)
		var rotation_degrees = Vector3(101.7, 0, 0)
		var rotation_radians2 = rotation_degrees * PI / 180.0
		icube20.rotation_degrees = rotation_degrees # Godot 4.x uses 'rotation_degrees' instead of 'rotation'
		add_child(icube20)
		print(icube20.scale)
		outer_layer_infos.append(icube20)
	follow_object20 = icube20_instance

func _spawn_outerLayer3() -> void:# ANIMAL RING
	_delete_objects_from_array(outer_layer_foods)
	_delete_objects_from_array(outer_layer_items)
	_delete_objects_from_array(outer_layer_infos)
	if outer_layer_animals.size() < 20 :
		var icube3: StaticBody3D = outer_layer_animal.instantiate()
		var custom_scale = Vector3(0.5, 0.5, 0.5)
		icube3.scale = custom_scale
		icube3.transform.origin =  Vector3(0, 1.1, -1.12)
		print(icube3.scale) # This should now print (0.5, 0.5, 0.5)
		icube3_instance = icube3
		#var angle2 = 2 * PI * outer_layer_items.size() / 20  # Distribute cubes evenly in a circle
		#var radius2 = 5  # Define the radius of the circle
		#var x2 = radius2 * cos(angle2)
		#var z2 = radius2 * sin(angle2)
		#icube2.global_transform.origin = Vector3(0, 2.349, -2.271)
		var rotation_degrees = Vector3(101.7, 0, 0)
		var rotation_radians2 = rotation_degrees * PI / 180.0
		icube3.rotation_degrees = rotation_degrees # Godot 4.x uses 'rotation_degrees' instead of 'rotation'
		add_child(icube3)
		print(icube3.scale)
		outer_layer_animals.append(icube3)
	follow_object3 = icube3_instance

func _spawn_Cupcake() -> void:# CUPCAKES
	if cupcakes.size() < 20 :
		var icube4: RigidBody3D = cupcake.instantiate()
		icube4.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		#icube4_instance = icube4
		#icube4.global_transform.origin = Vector3(-0.2, 1.2, 0.0)
		#var rotation_degrees = Vector3(101.7, 0, 0)
		#var rotation_radians3 = rotation_degrees * PI / 180.0
		#icube4.rotation_degrees = rotation_degrees # Godot 4.x uses 'rotation_degrees' instead of 'rotation'
		add_child(icube4)
		icube4.global_transform = follow_object12.global_transform
		cupcakes.append(icube4)
	#follow_object4 = icube4_instance

func _spawn_pizza() -> void:# PIZZAS
	if pizzas.size() < 20 :
		var icube5: RigidBody3D = pizza.instantiate()
		icube5.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		#var angle5 = 2 * PI * outer_layer_animals.size() / 20  # Distribute cubes evenly in a circle
		#var radius5 = 5  # Define the radius of the circle
		#var x5 = radius5 * cos(angle5)
		#var z5 = radius5 * sin(angle5)
		#icube5.global_transform.origin = Vector3(0, 2.349, -2.271)
		#var rotation_degrees = Vector3(101.7, 0, 0)
		#var rotation_radians5 = rotation_degrees * PI / 180.0
		#icube5.rotation_degrees = rotation_degrees # Godot 4.x uses 'rotation_degrees' instead of 'rotation'
		add_child(icube5)
		icube5.global_transform = follow_object12.global_transform
		pizzas.append(icube5)

func _spawn_burger() -> void:# BURGERS
	if burgers.size() < 20 :
		var icube6: RigidBody3D = burger.instantiate()
		add_child(icube6)
		#icube6.transform.origin =  Vector3(0, 1.1, -1.12)
		icube6.global_transform = follow_object12.global_transform
		burgers.append(icube6)
		icube6.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC

func _spawn_donut() -> void:# DONUTS
	if donuts.size() < 20 :
		var icube7: RigidBody3D = donut.instantiate()
		add_child(icube7)
		icube7.global_transform = follow_object12.global_transform
		donuts.append(icube7)
		icube7.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC

func _spawn_icecream() -> void:# ICECREAM
	if icecreams.size() < 20 :
		var icube8: RigidBody3D = icecream.instantiate()
		icube8.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		add_child(icube8)
		icube8.global_transform = follow_object12.global_transform
		icecreams.append(icube8)

func _spawn_hotdog() -> void:# HOTDOGS
	if hotdogs.size() < 20 :
		var icube9: RigidBody3D = hotdog.instantiate()
		icube9.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		add_child(icube9)
		icube9.global_transform = follow_object12.global_transform
		hotdogs.append(icube9)

func _spawn_soda() -> void:# SODAS
	if sodas.size() < 20 :
		var icube10: RigidBody3D = soda.instantiate()
		icube10.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		add_child(icube10)
		icube10.global_transform = follow_object12.global_transform
		sodas.append(icube10)

func _spawn_waffle() -> void:# WAFFLES
	if waffles.size() < 20 :
		var icube11: RigidBody3D = waffle.instantiate()
		icube11.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		add_child(icube11)
		icube11.global_transform = follow_object12.global_transform
		waffles.append(icube11)

func _spawn_book() -> void:# BOOK
	if books.size() < 20 :
		var icube13: RigidBody3D = book.instantiate()
		icube13.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		add_child(icube13)
		icube13.global_transform = follow_object12.global_transform
		books.append(icube13)

func _spawn_sword() -> void:# SWORD
	if swords.size() < 20 :
		var icube14: RigidBody3D = sword.instantiate()
		icube14.freeze_mode = RigidBody3D.FREEZE_MODE_STATIC
		add_child(icube14)
		icube14.global_transform = follow_object12.global_transform
		swords.append(icube14)

func _spawn_spawnBox() -> void:# SPAWNBOX
	if spawnBoxs.size() < 20 :
		var icube12: StaticBody3D = spawnBox.instantiate()
		icube12_instance = icube12
		add_child(icube12)
		follow_object12 = icube12_instance
		spawnBoxs.append(icube12)

func toggle_collision_for_group(group_name: String, enabled: bool) -> void:
	for node in get_tree().get_nodes_in_group(group_name):
		if node is CollisionShape3D:
			node.disabled = !enabled
		elif node is Area3D or node is PhysicsBody3D:
			for child in node.get_children():
				if child is CollisionShape3D:
					child.disabled = !enabled

func _on_inner_layer_label_clicked():
	toggle_collision_for_group("food_collision_shapes", true)
	toggle_collision_for_group("items_collision_shapes", false)
	_spawn_outerLayer()
	_spawn_spawnBox()


func _on_treasure_chest_label_clicked():
	toggle_collision_for_group("food_collision_shapes", false)
	toggle_collision_for_group("items_collision_shapes", true)
	_spawn_outerLayer2()


func _on_paw_label_clicked():
	_spawn_outerLayer3()
	toggle_collision_for_group("food_collision_shapes", false)
	toggle_collision_for_group("items_collision_shapes", false)



func _on_cupcake_2_label_clicked():
	toggle_collision_for_group("food_collision_shapes", true)
	_spawn_Cupcake()


func _on_pizza_label_clicked():
	toggle_collision_for_group("food_collision_shapes", true)
	_spawn_pizza()


func _on_burger_icon_label_clicked():
	_spawn_burger()
	toggle_collision_for_group("food_collision_shapes", true)


func _on_donut_icon_label_clicked():
	_spawn_donut()
	toggle_collision_for_group("food_collision_shapes", true)


func _on_icecream_label_clicked():
	_spawn_icecream()
	toggle_collision_for_group("food_collision_shapes", true)


func _on_hotdog_icon_label_clicked():
	_spawn_hotdog()
	toggle_collision_for_group("food_collision_shapes", true)


func _on_soda_icon_label_clicked():
	_spawn_soda()
	toggle_collision_for_group("food_collision_shapes", true)


func _on_waffle_icon_label_clicked():
	_spawn_soda()
	toggle_collision_for_group("food_collision_shapes", true)


func _on_book_icon_label_clicked():
	_spawn_book()
	toggle_collision_for_group("food_collision_shapes", false)
	toggle_collision_for_group("items_collision_shapes", true)


func _on_sword_icon_label_clicked():
	_spawn_sword()
	toggle_collision_for_group("food_collision_shapes", false)
	toggle_collision_for_group("items_collision_shapes", true)


func _on_info_icon_label_clicked():
	_spawn_infoLayer()
	toggle_collision_for_group("food_collision_shapes", true)
	toggle_collision_for_group("items_collision_shapes", false)
