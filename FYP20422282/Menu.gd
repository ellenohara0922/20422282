extends Node3D

# The scenes and arrays for different objects are defined as export variables or regular variables

# The hand nodes
@onready var menu: Node3D = $Menu
@onready var left_hand_node: Node3D = get_node("/root/Main/Player/LeftHand")
@onready var right_hand_node: Node3D = get_node("/root/Main/Player/RightHand")

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# If using left hand, change this to left_hand_node
	var hand = right_hand_node
	position_menu_at_hand(hand)

func _process(delta: float) -> void:
	# If using left hand, change this to left_hand_node
	var hand = right_hand_node
	position_menu_at_hand(hand)

func position_menu_at_hand(hand: Node3D) -> void:
	if hand:
		global_transform.origin = hand.global_transform.origin
		# If you want an offset from the hand's position
		global_transform.origin += Vector3(0.0, 0.2, 0.0)
	else:
		print("Hand node not found.")

# The rest of your functions for spawning and deleting objects follow here
