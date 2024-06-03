extends Node

var score : int = 0
var credits: int = 1 

#movimiento del player, ejes de movimiento. Lo pongo fuera de la funcion para que no se este creando una variable
#cada vez que a funcion sea llamada, vamos que de esta forma se optimiza el codigo.
var axis: Vector2


#Funcion para retornar la direccion pulsada

func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
