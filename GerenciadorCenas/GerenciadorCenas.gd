extends CanvasLayer


export(String, FILE, "*.tscn") var primeira_cena = ""

onready var animacao = $Controle/Animacao
onready var container_cena = $ContainerCena


var cena_atual
var caminho_proxima_cena:String = ""

func registrar_cena_atual(cena:Node) -> void:
	if not cena_atual:
		cena_atual = cena
		_configurar_sinal_proxima_cena(cena)
	#_preparar_mudanca_cena(caminho_cena)

func _configurar_sinal_proxima_cena(cena:Node) -> void:
	cena.connect("proxima_cena", self, "_manipular_troca_cena", [cena.name])
	
func _manipular_troca_cena(nome_cena_atual:String):
	print("nome_cena_atual: ", nome_cena_atual)
	var caminho_cena = ""
	if nome_cena_atual == "CenaPrincipal":
		caminho_cena = "res://cenas/Cena1.tscn"
	elif nome_cena_atual == "Cena1":
		caminho_cena = "res://cenas/Cena2.tscn"
	elif nome_cena_atual == "Cena2":
		caminho_cena = "res://cenas/CenaPrincipal.tscn"
	else:
		return
	print("caminho_cena: ", caminho_cena)
	_preparar_mudanca_cena(caminho_cena)

#func _ready() -> void:
#	if primeira_cena:
#		_preparar_mudanca_cena(primeira_cena)

func _preparar_mudanca_cena(caminho_cena:String) -> void:
	caminho_proxima_cena = caminho_cena
	animacao.play("transicao_cena")

func _mudar_cena() -> void:
	var cena = load(caminho_proxima_cena)
	if cena:		
		if cena_atual:
			cena_atual.queue_free()
			
		var instancia_cena = cena.instance()
		
		_configurar_sinal_proxima_cena(instancia_cena)
		
		container_cena.add_child(instancia_cena)
		cena_atual = instancia_cena
		

func _get_configuration_warning() -> String:
	if not primeira_cena:
		return "Necessário configurar a propriedade Primeira Cena"
	else:
		return ""
