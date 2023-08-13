extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Paper.incontrol = true
	$Rock.incontrol = false
	$Scissors.incontrol = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("1"):
		$Paper.incontrol = false
		$Rock.incontrol = true
		$Scissors.incontrol = false
	if Input.is_action_just_pressed("2"):
		$Paper.incontrol = true
		$Rock.incontrol = false
		$Scissors.incontrol = false
	if Input.is_action_just_pressed("3"):
		$Paper.incontrol = false
		$Rock.incontrol = false
		$Scissors.incontrol = true
