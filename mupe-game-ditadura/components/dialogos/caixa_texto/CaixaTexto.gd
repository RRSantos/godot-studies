extends Control


onready var label = $Margem/Texto

func set_texto(texto:String):
	label.text = texto
