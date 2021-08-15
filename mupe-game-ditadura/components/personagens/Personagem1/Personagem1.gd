extends KinematicBody2D


onready var animacao = $Animacao
onready var areaDialogo  = $AreaDialogo
onready var areaClick  = $AreaClick

signal entrou_area_dialogo
signal saiu_area_dialogo
signal clicado

func _ready() -> void:
	animacao.play("parado")
	areaDialogo.connect("area_entered", self, "_on_entrou_area_dialogo")
	areaDialogo.connect("area_exited", self, "_on_saiu_area_dialogo")
	areaClick.connect("input_event", self, "_on_self_input_event")
	
func _on_entrou_area_dialogo(area:Area2D):
	emit_signal("entrou_area_dialogo")
	
func _on_saiu_area_dialogo(area:Area2D):
	emit_signal("saiu_area_dialogo")

func _on_self_input_event(viewport: Node, event: InputEvent, shape_idx: int):	
	if event is InputEventMouse and event.is_pressed():
		emit_signal("clicado")
