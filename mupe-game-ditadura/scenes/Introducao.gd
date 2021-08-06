extends Control


onready var botaoIniciar = $BotaoIniciar
onready var texto = $FundoTexto/TextoIntroducao

func _ready() -> void:
	botaoIniciar.connect("pressed", self, "_on_botaoIniciar_pressed")
	texto.percent_visible = 0
	botaoIniciar.hide()


func _on_botaoIniciar_pressed():
	get_tree().change_scene("res://scenes/SaoPaulo.tscn")
	
func _input(event: InputEvent):
	if event is InputEventMouse and event.is_pressed():
		texto.percent_visible = 1
	
func _process(delta):
	if texto.percent_visible < 1:
		texto.percent_visible += 0.05 * delta
	else:
		botaoIniciar.show()
