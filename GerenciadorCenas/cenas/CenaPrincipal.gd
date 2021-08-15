extends Node2D

signal proxima_cena
	

func _ready() -> void:
	GerenciadorCenas.registrar_cena_atual(get_tree().current_scene)

func _on_Button_pressed() -> void:
	
	emit_signal("proxima_cena")
