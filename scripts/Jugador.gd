extends KinematicBody2D

#---------Variables------------
var velocidad= 100
var animacion=""
#---------Nodos guardados en variables----------
onready var animaciones=$AnimatedSprite
onready var mira= $RayCast2D

func _physics_process(delta):
	var movimiento = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		movimiento.y-= velocidad
		mira.set_cast_to(Vector2(0,-50))
		animacion="Movi_Arriba"
	elif mira.get_cast_to() == Vector2 (0,-50):
		animacion="Quieto_arriba"
		
	if Input.is_action_pressed("ui_down"):
		movimiento.y += velocidad
		mira.set_cast_to(Vector2(0,50))
		animacion="Movi_Abajo"
	elif mira.get_cast_to()== Vector2 (0,50):
		animacion="Quieto_abajo"
		
	if Input.is_action_pressed("ui_left"):
		movimiento.x-=velocidad
		mira.set_cast_to(Vector2(-50,0))
		animacion="Movi_izq"
	elif mira.get_cast_to()== Vector2 (-50,0):
		animacion="Quieto_Izq"
		
	if Input.is_action_pressed("ui_right"):
		movimiento.x+=velocidad
		mira.set_cast_to(Vector2(50,0))
		animacion="Movi_der"
	elif mira.get_cast_to()== Vector2 (50,0):
		animacion="Quieto_der"
		
	move_and_slide(movimiento)
	animaciones.play(animacion)
	print(movimiento)
