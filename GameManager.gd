extends Node2D

var game_started : bool = false

@onready var player : Area2D = get_parent().get_node("Player")

@onready var screen_middle : Node2D = get_parent().get_node("ScreenMiddle")

@onready var screen_bottom : Node2D = get_parent().get_node("ScreenMiddle/ScreenBottom")
@onready var screen_top : Node2D = get_parent().get_node("ScreenMiddle/ScreenTop")
@onready var screen_left : Node2D = get_parent().get_node("ScreenMiddle/ScreenLeft")
@onready var screen_right : Node2D = get_parent().get_node("ScreenMiddle/ScreenRight")

var obstacle : PackedScene = preload("res://Prefabs/obstacle_parent.tscn")

@export var obstacle_gap : float = 500

var last_generated_obstacle_pos : float 

@export var min_obstacle_spawn_Y : float = 200
@export var max_obstacle_spawn_Y : float = -200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(Input.is_action_just_pressed("jump")):
		game_started = true
	
	if (player.position.y > screen_bottom.position.y):
		game_started = false
		
	if (screen_middle.position.x > last_generated_obstacle_pos + obstacle_gap):
		generate_obstacle()
		last_generated_obstacle_pos = screen_middle.position.x
	
	screen_middle.position.x = player.position.x
	pass
	
func generate_obstacle():
	
	var o = obstacle.instantiate()
	
	get_parent().add_child(o)
	
	o.position = Vector2(screen_right.global_position.x + 100, randf_range(min_obstacle_spawn_Y, max_obstacle_spawn_Y))
	
	pass
