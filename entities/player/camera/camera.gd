extends Camera3D

@export var sensitivity: float = 0.1
var x: float
var y: float
var tp: Vector3

func _ready():
	tp = position

func _input(event):
	if event is InputEventMouseMotion:
		look_x(-event.relative.y * sensitivity)
		look_y(-event.relative.x * sensitivity)

func _process(delta):
	$"..".basis = Basis()
	$"..".rotate_x(deg_to_rad(x))
	$"..".rotate_y(deg_to_rad(y))

func look_x(degrees: float):
	x += degrees
	if x > 90: x = 90
	elif x < -90: x = -90

func look_y(degrees: float):
	y = wrapf(y + degrees, 0, 360)
