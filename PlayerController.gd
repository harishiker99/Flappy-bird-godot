extends Area2D

@export var x_move_speed : float = 150

@export var jump_force : float = -750
@export var gravity_force : float = 750

var y_velocity : float = 0

@onready var game_manager : Node2D = get_parent().get_node("GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var x_movement = 0
	
	if (game_manager.game_started):
	
		x_movement = x_move_speed
			
		if (Input.is_action_pressed("right")):
			x_movement = x_move_speed
			
		if (Input.is_action_just_pressed("jump")):
			bounce()
	
		y_velocity += gravity_force * delta
		
		
		position = Vector2(position.x + x_movement * delta, position.y + y_velocity * delta) 
	
	pass

func bounce():
	
	y_velocity = jump_force
	
	pass


func _on_area_entered(area):
	
	game_manager.game_started = false
	print("game over")
	
	pass # Replace with function body.
