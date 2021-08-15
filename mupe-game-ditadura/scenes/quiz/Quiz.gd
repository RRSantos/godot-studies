extends Control

onready var componente_quiz = $MarginContainer/ComponenteQuiz

func _ready() -> void:
	componente_quiz.connect("acertou", self, "_on_acertou_resposta")
	componente_quiz.connect("errou", self, "_on_errou_resposta")


func _on_acertou_resposta():
	pass
	
func _on_errou_resposta():
	pass
