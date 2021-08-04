extends Control


onready var botaoIniciar = $BotaoIniciar
onready var texto = $TextoIntroducao

func _ready() -> void:
	botaoIniciar.connect("pressed", self, "_on_botaoIniciar_pressed")
	texto.percent_visible = 0


func _on_botaoIniciar_pressed():
	get_tree().change_scene("res://scenes/SaoPaulo.tscn")
	
func _process(delta):
	texto.percent_visible += 0.1 * delta
