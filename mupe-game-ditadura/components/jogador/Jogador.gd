extends KinematicBody2D

const VELOCIDADE_MAXIMA = 300
onready var colisao = $Colisao
onready var animacao = $Animacao

var _velocidade = Vector2.ZERO


func _obterDirecao() -> Vector2:
	var direcao_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var direcao_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var direcao = Vector2(direcao_x, direcao_y)
	return direcao.normalized()

func _moverPersonagem(direcao_personagem:Vector2):
	if direcao_personagem == Vector2.ZERO:
		animacao.play("parado")
	else:
		animacao.play("andando")
		if direcao_personagem.x != 0:
			animacao.flip_h = direcao_personagem.x < 0		

	_velocidade = move_and_slide(direcao_personagem*VELOCIDADE_MAXIMA)


func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direcao = _obterDirecao()
	_moverPersonagem(direcao)
	
