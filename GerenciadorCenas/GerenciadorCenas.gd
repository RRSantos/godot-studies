extends CanvasLayer


export(String, FILE, "*.tscn") var primeira_cena = ""

onready var animacao = $Controle/Animacao
onready var container_cena = $ContainerCena
onready var resolvedor_cena:ResolvedorCena = ResolvedorCena.new()

var cena_atual
var caminho_proxima_cena:String = ""

func registrar_cena_atual(cena:Node) -> void:
	if not cena_atual:
		cena_atual = cena
		_configurar_sinal_proxima_cena(cena)

func _configurar_sinal_proxima_cena(cena:Node) -> void:
	cena.connect("proxima_cena", self, "_manipular_troca_cena", [cena.name])
	
func _manipular_troca_cena(nome_cena_atual:String):	
	var caminho_cena:String = resolvedor_cena.obter_caminho_proxima_cena(nome_cena_atual)	
	_preparar_mudanca_cena(caminho_cena)

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
