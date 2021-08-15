extends Control

export(float) var velocidade_texto = 0.1
export(String) var _nome_personagem = "Nome do personagem"
export(Texture) var _imagem_personagem = null

signal texto_totalmente_exibido

onready var _nome:Label = $Fundo/Margem/ContainerDialogo/ContainerPersonagem/VBoxPersonagem/NomePersonagem
onready var _imagem:TextureRect = $Fundo/Margem/ContainerDialogo/ContainerPersonagem/VBoxPersonagem/ImagemPersonagem
onready var _texto_dialogo:Label = $Fundo/Margem/ContainerDialogo/TextoPersonagem

var evento_texto_totalmente_exibido_disparado = false

func _ready() -> void:
	_nome.text = _nome_personagem
	_imagem.texture = _imagem_personagem

func _get_configuration_warning() -> String:
	var erro = ""
	if _imagem_personagem == null:
		erro =  "É necessário informar uma imagem para a personagem, no campo Imagem Personagem"
	
	return erro
	
func exibir_texto(texto:String):
	_texto_dialogo.percent_visible = 0
	_texto_dialogo.text = texto
	evento_texto_totalmente_exibido_disparado = false

func _mouse_foi_clicado() -> bool:	
	return Input.is_mouse_button_pressed(1) and (self.get_local_mouse_position().x > 0 and self.get_local_mouse_position().y > 0)
	
func _process(delta: float):
	if _mouse_foi_clicado():
		_texto_dialogo.percent_visible = 1
		
	if _texto_dialogo.percent_visible < 1:
		_texto_dialogo.percent_visible += delta * velocidade_texto
	elif not evento_texto_totalmente_exibido_disparado:
		emit_signal("texto_totalmente_exibido")
		evento_texto_totalmente_exibido_disparado = true
	

func _on_TextoPersonagem_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		print("Clicou! _on_Fundo_gui_input")
