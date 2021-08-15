extends Control


onready var dialogo = $Container/DialogoComUmPersonagem
onready var jornal = $Container/BoxJornal/Jornal
onready var animacao_jornal = $Container/BoxJornal/Jornal/Animacao

func _mostrar_jornais():	
	animacao_jornal.play("fade_in")
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://scenes/quiz/Quiz.tscn")
	


func _ready() -> void:
	jornal.modulate.a = 0
	dialogo.exibir_texto("\nAqui, eu não tinha dinheiro para comprar jornal, só via as manchetes, então, não sabia direito o que estava acontecendo.\nNo Colégio de Contabilidade é um pessoal extremamente direitista, reacionário, a direção, os professores, então, eu não sabia direito o que estava acontecendo no golpe de 1964 (...)\n\nAí, primeiro de abril ficou aquele clima, o Jango [João Goulart, presidente até então] fugiu, (...). Mas aí, eu fiquei assim. Lá, depois do golpe é que eu comecei a conversar com os caras.")
	yield(dialogo, "texto_totalmente_exibido")
	_mostrar_jornais()
	
