extends Control


onready var botaoJogar = $FundoMenu/Menu/BotaoJogar
onready var botaoSair = $FundoMenu/Menu/BotaoSair


func _ready() -> void:
	botaoJogar.connect("pressed", self, "_on_botaoJogar_pressed")
	botaoSair.connect("pressed", self, "_on_botaoSair_pressed")


func _on_botaoJogar_pressed():
	get_tree().change_scene("res://scenes/Introducao.tscn")

func _on_botaoSair_pressed():
	get_tree().quit()
