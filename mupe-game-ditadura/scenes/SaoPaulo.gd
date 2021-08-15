extends Node2D


onready var personagem1 = $Personagem1
onready var jogador = $Jogador
onready var caixa_texto = $Personagem1/CaixaTexto


func _ready() -> void:
	personagem1.connect("entrou_area_dialogo", self, "_on_entrou_area_dialogo_personagem1")
	personagem1.connect("saiu_area_dialogo", self, "_on_saiu_area_dialogo_personagem1")
	personagem1.connect("clicado", self, "_on_personagem1_clicado")
	caixa_texto.set_texto("Oi! Eu sou o Personagem 1 e tenho uma mensagem importante para você\nClique em mim para acessá-la.")
	caixa_texto.hide()


func _on_entrou_area_dialogo_personagem1():
	caixa_texto.show()
	
func _on_saiu_area_dialogo_personagem1():
	caixa_texto.hide()
	
func _physics_process(delta: float):
	var direcao_relativa_personagem1 = personagem1.position.direction_to(jogador.position)
	personagem1.animacao.flip_h = direcao_relativa_personagem1.x < 0
	
func _on_personagem1_clicado():
	get_tree().change_scene("res://scenes/dialogos/DialogoPersonagem1.tscn")
