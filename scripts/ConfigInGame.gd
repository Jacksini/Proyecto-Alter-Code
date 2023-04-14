extends TextureRect

var WinFlag = false

func _on_Controles_pressed():
	$Controles.disabled = true
	$Video.disabled = false
	$Audio.disabled = false
	$Creditos.disabled = false
	$Video/CheckButton.visible = false
	$Controles/ControlesCtrl.visible = true
	$Audio/ConfVolume.visible = false


func _on_Video_pressed():
	$Video.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Audio.disabled = false
	$Controles/ControlesCtrl.visible = false
	$Video/CheckButton.visible = true
	$Audio/ConfVolume.visible = false


func _on_Audio_pressed():
	$Audio.disabled = true
	$Creditos.disabled = false
	$Controles.disabled = false
	$Video.disabled = false
	$Video/CheckButton.visible = false
	$Controles/ControlesCtrl.visible = false
	$Audio/ConfVolume.visible = true


func _on_Creditos_pressed():
	$"../AnimationPlayer".play("Fade_In")
	$".".visible = false
	$"../Creditoss".visible = true


func _on_SalirConfiig_pressed():
	
	pass # Replace with function body.


func _on_CheckButton_pressed():
	if WinFlag !=  true:
		OS.window_fullscreen = true
		WinFlag = true
	else:
		OS.window_fullscreen = false
		WinFlag = false

func _on_Master_scrolling():
	evaluarVolumen()

func _on_Music_scrolling():
	evaluarVolumen()

func evaluarVolumen():
	Globales.VolMaster = $Audio/ConfVolume/VolMaster/Master.value
	$Audio/ConfVolume/VolMaster/PerVolume.text = str(Globales.VolMaster) + str(" %")
	Globales.VolMusic = $Audio/ConfVolume/VolMusic/Music.value
	$Audio/ConfVolume/VolMusic/PerVolume.text = str(Globales.VolMusic) + str(" %")


func _on_Reresar_pressed():
	$"../Creditoss".visible = false
	$".".visible = true
	