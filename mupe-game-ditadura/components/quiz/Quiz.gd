extends Control


signal acertou
signal errou

export(String, FILE, "*.json") var arquivo_perguntas_json = "res://assets/json/quiz.json"

onready var label_pergunta:Label = $Fundo/MarginContainer/ContainerPergunta/Pergunta
onready var botao_alternativa1:Button = $Fundo/MarginContainer/ContainerPergunta/LayoutAlternativas/ContainerAlternativas/Alternativa1
onready var botao_alternativa2 = $Fundo/MarginContainer/ContainerPergunta/LayoutAlternativas/ContainerAlternativas/Alternativa2
onready var botao_alternativa3 = $Fundo/MarginContainer/ContainerPergunta/LayoutAlternativas/ContainerAlternativas/Alternativa3
onready var botao_alternativa4 = $Fundo/MarginContainer/ContainerPergunta/LayoutAlternativas/ContainerAlternativas/Alternativa4
onready var botao_alternativa5 = $Fundo/MarginContainer/ContainerPergunta/LayoutAlternativas/ContainerAlternativas/Alternativa5


var _pergunta_atual:PerguntaQuiz = null
var _pergunta_index = -1;
var _perguntas: Array = []

func _importarPerguntasDeJSON(json:Array) -> Array:
	var perguntas_importadas:Array = []
	for item in json:
		var pergunta:PerguntaQuiz = PerguntaQuiz.new()
		pergunta.texto = item["pergunta"]
		for alternativa in item["alternativas"]:
			pergunta.add_alternativa(alternativa)
		pergunta.alternativa_correta = item["alternativa_correta"]
		
		perguntas_importadas.append(pergunta)
		
	return perguntas_importadas

func _carregar_perguntas():
	var json_importado = _importar_arquivo(arquivo_perguntas_json)
	_perguntas = _importarPerguntasDeJSON(json_importado)
	
func _importar_arquivo(nome_arquivo_json:String) -> JSONParseResult:
	var file = File.new()
	file.open(nome_arquivo_json, file.READ)
	var json = file.get_as_text()
	file.close()
	var json_result = JSON.parse(json).result
	return json_result
	
func _preencher_componentes_tela():
	label_pergunta.text = _pergunta_atual.texto
	botao_alternativa1.text = _pergunta_atual.alternativas[0]
	botao_alternativa2.text = _pergunta_atual.alternativas[1]
	botao_alternativa3.text = _pergunta_atual.alternativas[2]
	botao_alternativa4.text = _pergunta_atual.alternativas[3]
	botao_alternativa5.text = _pergunta_atual.alternativas[4]
	
func _hablitar_desabilitar_botoes():
	botao_alternativa1.disabled = not existem_mais_perguntas()
	botao_alternativa2.disabled = not existem_mais_perguntas()
	botao_alternativa3.disabled = not existem_mais_perguntas()
	botao_alternativa4.disabled = not existem_mais_perguntas()
	botao_alternativa5.disabled = not existem_mais_perguntas()
	
func _responder_pergunta(botao_pressionado:Button):
	if botao_pressionado.text == _pergunta_atual.alternativa_correta:
		emit_signal("acertou")
	else:
		emit_signal("errou")

func _ready() -> void:
	botao_alternativa1.connect("pressed", self, "_responder_pergunta", [botao_alternativa1])
	botao_alternativa2.connect("pressed", self, "_responder_pergunta", [botao_alternativa2])
	botao_alternativa3.connect("pressed", self, "_responder_pergunta", [botao_alternativa3])
	botao_alternativa4.connect("pressed", self, "_responder_pergunta", [botao_alternativa4])
	botao_alternativa5.connect("pressed", self, "_responder_pergunta", [botao_alternativa5])
	_carregar_perguntas()
	exibir_proxima_pergunta()

func exibir_proxima_pergunta():
	_hablitar_desabilitar_botoes()
	if existem_mais_perguntas():
		_pergunta_index+=1
		_pergunta_atual = _perguntas[_pergunta_index]
		_preencher_componentes_tela()
	
func existem_mais_perguntas() -> bool:
	return _perguntas.size() > _pergunta_index +1




