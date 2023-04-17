extends Control

var time = 0
var timer_on = false
var suma = 0
var turnoActivacion = Globales.Turno
var activacion = false
var activacionEnemy = false
var activacionBurn = false
var test = 0
var tipoPlayer = 6
var tipoEnemy = 2
var multiplicadorDamage = 1
var accion = 0
var flagEvalUltimate = false
var PorcentajeUltimate = 20

func aleatorio():
	return (randi() % 3 + 1)

func _process(delta):
	time += delta
	quemadura()
	evasion()
	ultimateJefe()
	evaluarGameOver()
	
func _ready():
	$Ultimate/UltimateProgress.value = PorcentajeUltimate
func evaluarUltimate():
	if(Globales.Charge >= 8):
		$Ultimate.disabled = false
	else:
		$Ultimate.disabled = true
	PorcentajeUltimate += 10
	$Ultimate/UltimateProgress.value = PorcentajeUltimate


func findePartida():
	if(Globales.VidaJefe <= 0):
		print("QUE PENDEJO TE MATO")
	if(Globales.VidaSalter <= 0):
		print ("CABRON GANASTE")
		
func evasion():
	if activacion ==  true:
		Globales.evadir = 0
		if Globales.Turno == turnoActivacion + 4:
			Globales.evadir = 1
			activacion = false 
			print("ya no evado")

func ComparacionDeTipo(var player,var enemy):
	#comparativa atk 1
	if player == 1 and enemy == 1 :
		return 1.00
	if player == 1 and enemy == 2 :
		return 0.50
	if player == 1 and enemy == 3 :
		return 1.00
	if player == 1 and enemy == 4 :
		return 1.00
	if player == 1 and enemy == 5 :
		return 2.00
	if player == 1 and enemy == 6 :
		return 1.00
	if player == 1 and enemy == 7 :
		return 1.00
	#comparativa atk 2
	if player == 2 and enemy == 1 :
		return 2.00
	if player == 2 and enemy == 2 :
		return 1.00
	if player == 2 and enemy == 3 :
		return 2.00
	if player == 2 and enemy == 4 :
		return 1.00
	if player == 2 and enemy == 5 :
		return 1.00
	if player == 2 and enemy == 6 :
		return 0.50
	if player == 2 and enemy == 7 :
		return 1.00
	#comparativa atk 3
	if player == 3 and enemy == 1 :
		return 2.00
	if player == 3 and enemy == 2 :
		return 0.50
	if player == 3 and enemy == 3 :
		return 1.00
	if player == 3 and enemy == 4 :
		return 1.00
	if player == 3 and enemy == 5 :
		return 1.00
	if player == 3 and enemy == 6 :
		return 0.50
	if player == 3 and enemy == 7 :
		return 2.00
	#comparativa atk 4
	if player == 4 and enemy == 1 :
		return 2.00
	if player == 4 and enemy == 2 :
		return 1.00
	if player == 4 and enemy == 3 :
		return 0.50
	if player == 4 and enemy == 4 :
		return 0.50
	if player == 4 and enemy == 5 :
		return 0.50
	if player == 4 and enemy == 6 :
		return 1.00
	if player == 4 and enemy == 7 :
		return 2.00
	#comparativa atk 5
	if player == 5 and enemy == 1 :
		return 2.00
	if player == 5 and enemy == 2 :
		return 1.00
	if player == 5 and enemy == 3 :
		return 1.00
	if player == 5 and enemy == 4 :
		return 0.50
	if player == 5 and enemy == 5 :
		return 1.00
	if player == 5 and enemy == 6 :
		return 2.00
	if player == 5 and enemy == 7 :
		return 0.50
	#comparativa atk 6
	if player == 6 and enemy == 1 :
		return 1.00
	if player == 6 and enemy == 2 :
		return 0.50
	if player == 6 and enemy == 3 :
		return 2.00
	if player == 6 and enemy == 4 :
		return 1.00
	if player == 6 and enemy == 5 :
		return 0.50
	if player == 6 and enemy == 6 :
		return 0.50
	if player == 6 and enemy == 7 :
		return 0.50
	#comparativa atk 7
	if player == 7 and enemy == 1 :
		return 1.00
	if player == 7 and enemy == 2 :
		return 0.50
	if player == 7 and enemy == 3 :
		return 2.00
	if player == 7 and enemy == 4 :
		return 0.50
	if player == 7 and enemy == 5 :
		return 0.50
	if player == 7 and enemy == 6 :
		return 2.00
	if player == 7 and enemy == 7 :
		return 1.00

func quemadura():
	if(timer_on == true):
		suma += 1
		if suma == 100 or suma == 200 or suma == 300 :
			if activacionBurn == true:
				if (Globales.VidaSalter - 150) <= 150 :
					Globales.VidaSalter = 1
				else:
					Globales.VidaSalter = Globales.VidaSalter - 150.00
				$AnimationPlayer.play("DamageSalter")
			if activacionEnemy == true:
				
				Globales.VidaJefe -= 100.00
		if suma == 301:
			timer_on = false
			time = 0
			suma = 0
			activacionBurn = false
			activacionEnemy = false

#FUNCIONES DE ATAQUE DEL JEFE

func _on_Subfusil_pressed():
	SubfusilJefe()
	SalterGod()
	evaluarUltimate()
	findePartida()

func _on_Granada_pressed():
	GranadaJefe()
	SalterGod()
	evaluarUltimate()
	findePartida()

func _on_Embestida_pressed():
	EmbestidaJefe()
	SalterGod()
	evaluarUltimate()
	findePartida()

func _on_Vida_pressed():
	SuministrosJefe()
	SalterGod()
	evaluarUltimate()
	findePartida()

func _on_Ultimate_pressed():
#	if(Globales.VidaJefe <= Globales.VidaMaximaJefe * 0.8):
	ultimate()
	SalterGod()
	evaluarUltimate()
	$Ultimate/UltimateProgress.value = 20
	PorcentajeUltimate = 20

#Funciones de Evaluacion

func EvaluarEstamina(var Estamina, var EstaminaMaxima):
	if Estamina > EstaminaMaxima:
		return EstaminaMaxima
	else:
		return Estamina

func EvaluarVida(var vida, var vidaMaxima):
	if	vida > vidaMaxima:
		return vidaMaxima
	else:
		return vida

#Funciones de ataque
func SubfusilJefe():
	print(Globales.VidaJefe)
	if Globales.EstaminaJefe >= 15:
		multiplicadorDamage = ComparacionDeTipo(1,2)
		Globales.VidaSalter = Globales.VidaSalter - (multiplicadorDamage * (Globales.Ataquejefe - (Globales.DefensaSalter * (Globales.Ataquejefe/200.00))))
	Globales.EstaminaJefe = Globales.EstaminaJefe - 15
	Globales.Turno = Globales.Turno + 1
	Globales.Charge += 1
	$AnimationPlayer.play("DamageSalter")
	ControlsFmod.playEvent("Subfusil")

func SuministrosJefe():
	Globales.VidaJefe = Globales.VidaJefe + (Globales.VidaMaximaJefe * 0.10)
	Globales.VidaJefe = EvaluarVida(Globales.VidaJefe, Globales.VidaMaximaJefe)
	Globales.EstaminaJefe = Globales.EstaminaJefe + (Globales.EstaminaMaximaJefe * 0.10)
	Globales.EstaminaJefe = EvaluarEstamina(Globales.EstaminaJefe, Globales.EstaminaMaximaJefe)
	Globales.Turno = Globales.Turno + 1
	Globales.Charge += 1
	ControlsFmod.playEvent("Suministros")

func GranadaJefe():
	print(Globales.VidaJefe)
	if Globales.EstaminaJefe >= 30:
		activacionBurn = true
		timer_on = true
		$AnimationPlayer.play("DamageSalter")
		ControlsFmod.playEvent("PlasmaGrenade")
	Globales.EstaminaJefe = Globales.EstaminaJefe - 30
	Globales.Charge += 1
	Globales.Turno += 1
	
func EmbestidaJefe():
	print(Globales.VidaJefe)
	if Globales.EstaminaJefe >= 20:
		turnoActivacion = Globales.Turno
		activacion = true
		$AnimationPlayer.play("DamageSalter")
		ControlsFmod.playEvent("Embestida")
	Globales.Turno += 1
	Globales.Charge += 1
	
func ultimate():
	multiplicadorDamage = ComparacionDeTipo(6,2)
	Globales.VidaSalter = Globales.VidaSalter - (multiplicadorDamage * (Globales.EspecialJefe * ((Globales.VelocidadJefe - (Globales.VelocidadSalter/3)) *1)))
	Globales.Turno += 1
	Globales.Charge = 0
	$AnimationPlayer.play("DamageSalter")
	ControlsFmod.playEvent("MAC")
	#Funciones de daño se Salter

func Excalibur():
	multiplicadorDamage = ComparacionDeTipo(2,6)
	Globales.VidaJefe = Globales.VidaJefe - (Globales.evadir * (multiplicadorDamage * (Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/(1000.00-(Globales.VelocidadSalter/10)))))))
	ControlsFmod.playEvent("Excalibur")
	print("Excalibur")
	print("vida jefe: ", Globales.VidaJefe)
	print("-------")
	
	test = aleatorio()
	if test == 1:
		activacionEnemy = true
		timer_on = true

func avalon():
	Globales.VidaSalter = Globales.VidaSalter + (Globales.VidaMaximaSalter * 0.10)
	Globales.VidaSalter = EvaluarVida(Globales.VidaSalter, Globales.VidaMaximaSalter)
	print("avalon CURA")
	print("vida jefe: ", Globales.VidaJefe)
	print("-------")
	ControlsFmod.playEvent("Avalon")

func Barrera_del_viento_del_rey():
	multiplicadorDamage = ComparacionDeTipo(3,6)
	Globales.VidaJefe = Globales.VidaJefe - (Globales.evadir * (multiplicadorDamage * (Globales.AtaqueSalter - (Globales.DefensaJefe * (Globales.AtaqueSalter/1000.00)))))
	print("Barrera de viento")
	print("vida jefe: ", Globales.VidaJefe)
	print("-------")
	if (Globales.EstaminaJefe - 20) <= 0:
		Globales.EstaminaJefe = 0
	else:
		Globales.EstaminaJefe -= 20
	ControlsFmod.playEvent("BarreraViento")

func Corte_lateral_Buster():
	multiplicadorDamage = ComparacionDeTipo(1,6)
	test = (randi() % 6 + 1)
	Globales.VidaJefe = Globales.VidaJefe - (Globales.evadir * (multiplicadorDamage * (test * (Globales.AtaqueSalter/7 ))))
	ControlsFmod.setLocalParameter("Buster", "CuantosGolpes", test)
	ControlsFmod.playEvent("Buster")
	print("Corte Buster")
	print("vida jefe: ", Globales.VidaJefe)
	print("-------")

func HPlow():
	if Globales.VidaSalter <= (0.20 * (Globales.VidaMaximaSalter)):
		accion = 4

func SalterGod():
	accion = (randi() % 4 + 1)
	if accion == 1:
		print("excalibur")
		Excalibur()
		$AnimationPlayer.play("DamageJefe")
		HPlow()
	if accion == 2:
		print("barrera de viento")
		Barrera_del_viento_del_rey()
		$AnimationPlayer.play("DamageJefe")
		HPlow()
	if accion == 3:
		print("corte buster")
		Corte_lateral_Buster()
		$AnimationPlayer.play("DamageJefe")
		HPlow()
	if accion == 4:
		print("avalon")
		avalon()
		$AnimationPlayer.play("DamageJefe")
		HPlow()

func ultimateJefe():
	if $Ultimate/UltimateProgress.value == 100:
		$AnimationPlayer.play("Ultimate")
	pass
	
func evaluarGameOver():
	if Globales.VidaSalter > 0 and Globales.VidaJefe > 0:
		pass
	else:
		if Globales.VidaSalter <= 0:
			print("Salter ded")
			#$"../AnimationPlayer".play("Victoria")
			Globales.victoria = "true"
			ControlsFmod.setLocalParameter("Battle", "hasWon", 1)
		if Globales.VidaJefe <= 0:
			PorcentajeUltimate = 20
		if Globales.VidaJefe and Globales.VidaSalter <=0:
			PorcentajeUltimate = 20
		yield(get_tree().create_timer(0.1), "timeout")
		get_tree().change_scene("res://escenas/Menus/Informacion.tscn")
