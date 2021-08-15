extends Node

class_name ResolvedorCena

func obter_caminho_proxima_cena(nome_cena_atual:String) -> String:
	var caminho_cena = ""
	if nome_cena_atual == "MenunPrincipal":
		caminho_cena = "res://scenes/Introducao.tscn"
	elif nome_cena_atual == "Introducao":
		caminho_cena = "res://scenes/SaoPaulo.tscn"
	elif nome_cena_atual == "SaoPaulo":
		caminho_cena = "res://cenas/CenaPrincipal.tscn"
	
	return caminho_cena
