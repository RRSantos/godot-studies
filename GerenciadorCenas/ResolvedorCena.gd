extends Node

class_name ResolvedorCena

func obter_caminho_proxima_cena(nome_cena_atual:String) -> String:
	var caminho_cena = ""
	if nome_cena_atual == "CenaPrincipal":
		caminho_cena = "res://cenas/Cena1.tscn"
	elif nome_cena_atual == "Cena1":
		caminho_cena = "res://cenas/Cena2.tscn"
	elif nome_cena_atual == "Cena2":
		caminho_cena = "res://cenas/CenaPrincipal.tscn"
	
	return caminho_cena
