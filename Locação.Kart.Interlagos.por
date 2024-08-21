
// TRABALHO: LOCAÇÃO DE KART, LOCADORA INTERLAGOS
// GRUPO: Henrique Gonçalves, Eduardo Félix, Pedro Augusto
// 1º ADS, GILBERTO OLIVEIRA 
programa
{


	// Variáveis auxiliares 
	inteiro opc, i
	cadeia ok

	// Variáveis para locação de Karts
	inteiro k = 0, data = 1, qntdVezLockart[16]
	cadeia queroAlugarCircuito, seKartloc[16], modelokart[16]
	real valorDoCircuito = 0.0, faturamentoDia = 0.0, lucroDia = 0.0, lucroCircuito = 0.0, lucroKart, valorKart[16]

	// menu inicial
	funcao menu(){
		limpa()
   		escreva(" -= Locadora de Kart =-")
   		escreva("")
   		escreva("\n O que voce deseja?")
   		escreva("")
   		escreva("\n 1. Cadastro de Karts")
   		escreva("\n 2. Lista de karts")
  	 	escreva("\n 3. Lista de karts locados")
   		escreva("\n 4. Aluguel de kart")
   		escreva("\n 5. Devolucao de kart")
   		escreva("\n 6. Kart que mais gerou ganhos")
   		escreva("\n 7. Receita e lucro do dia")
   		escreva("\n 8. Locacao de circuito")
   		escreva("\n 9. Atualizacao de data")
   		escreva("\n 10. Sair do programa")
   		escreva("\n")
   		leia(opc)	

   		se(opc <=0 ou opc >=11){
   			menu()	
   		}
	}	
	
	//Cadastro de Karts
	funcao cadastrarKart(){
		//variável para laço de repetição 
		k = k + 1
		inteiro repetir = 1
   		escreva("\n Insira os seguintes dados para o cadastro do kart.")
   		escreva("\n Qual o modelo do kart? ")
   		leia(modelokart[k])
   		escreva("\n Qual o valor de locacao requerido? ")
   		leia(valorKart[k])
   		escreva("\n Quantas vezes o kart ja foi alugado? ")
   		leia(qntdVezLockart[k])

   			enquanto(repetir == 1){
   				escreva("\n O kart ja esta alugado? Responda com SIM ou NAO: ")
   				leia(seKartloc[k])
   				se(seKartloc[k] == "SIM" ou seKartloc[k] == "NAO"){
   					repetir = -1	
   				}senao{
   					repetir = 1
   				}			
   			} 			
   		limpa()
   		escreva("KART CADASTRADO COM SUCESSO EM NOSSO SISTEMA!")
   		escreva("")
   		escreva("\nAperte uma tecla para voltar ao menu!")
   		leia(ok)	
	}

	//Lista de Karts
	funcao listarKartsDisp(){
			limpa()
   			escreva("\nLISTA DE KARTS CADASTRADOS")
   			escreva("")
   			para(i = 1; i <= k; i++){
   				escreva("\n Kart N",i)
      			escreva("\n Modelo: ",modelokart[i])
      			escreva("\n Valor de locacao: ",valorKart[i])
      			escreva("\n Quantidade de locacoes: ", qntdVezLockart[i])
   			} 
   			escreva("\nAperte uma tecla para voltar ao menu!")
   			leia(ok)
		}

	//Listar Karts locados
	funcao listarKartsLocados(){
		limpa()
   		escreva("LISTA DE KARTS JA ALUGADOS")
   		escreva("")
   		 para(i = 1; i <= k; i++){
      		se(seKartloc[i] =="SIM"){
   		 	
         			escreva("\n Kart N",i)
        			escreva("\n Modelo: ",modelokart[i])
         			escreva("\n Valor de locacao: ",valorKart[i])
         			escreva("\n Quantidade de locacoes: ", qntdVezLockart[i])
   		 } 
      		
      	}
   		escreva("\nAperte uma tecla para voltar ao menu!")
   		leia(ok)
	}


	//Alugar um Kart
	funcao alugarKart(){
		//variavel para alugar o kart, útil apenas nessa função
		cadeia alugar
		limpa()
		escreva("\nKARTS DISPONÍVEIS PARA ALUGUEL: ")
		para(i = 1; i <= k; i++){
			se(seKartloc[i] == "NAO"){
				escreva("\n Kart N",i)
        			escreva("\n Modelo: ",modelokart[i])
         			escreva("\n Valor de locacao: ",valorKart[i])
         			escreva("\n Quantidade de locacoes: ", qntdVezLockart[i])
			}

		}
		
		escreva("\nQual modelo de Kart deseja alugar?")
		leia(alugar)
		limpa()

		para(i = 1; i <= k; i++){
			se(alugar == modelokart[i]){
				seKartloc[i] = "SIM"
         			lucroKart = valorKart[i] * 0.3
         			lucroDia = lucroDia + lucroKart
         			faturamentoDia = faturamentoDia + valorKart[i]
         			qntdVezLockart[i] = qntdVezLockart[i] + 1

         			escreva("\nKART ALUGADO COM SUCESSO")
	
			}	
		}
		
		escreva("\nAperte uma tecla para voltar ao menu!")
   		leia(ok)
			
	}

	//Devolver um kart alugado
	funcao devolverKart(){
		// variável para devolver kart, útil apenas nessa função
		cadeia devolver 
		limpa()
		escreva("\nKARTS JÁ ALUGADOS: ")
		para(i = 1; i <=k; i++){
			se(seKartloc[i] == "SIM"){
				escreva("\n Kart N",i)
        			escreva("\n Modelo: ",modelokart[i])
         			escreva("\n Valor de locacao: ",valorKart[i])
         			escreva("\n Quantidade de locacoes: ", qntdVezLockart[i])
			}

		}
		
		escreva("\nQual modelo de Kart deseja devolver?")
		leia(devolver)
		limpa()

		para(i = 1; i<=k; i++){
			se(devolver == modelokart[i]){
				seKartloc[i] = "NAO"
         			escreva("\nKART DEVOLVIDO COM SUCESSO")
			}
		}
		
		escreva("\nAperte uma tecla para voltar ao menu!")
   		leia(ok)
	}

	//Kart que mais gerou ganhos
	funcao kartMaiorGanho(){
		// variável para Kart que mais gerou ganho, útil apenas nessa função
		inteiro kartMaisgg = 0
		limpa()
		para(i = 1; i <= k; i++){
			se(qntdVezLockart[i] > kartMaisgg){
				kartMaisgg = i	
			}	
		}
		escreva("\n O KART MAIS ALUGADO DO DIA FOI: ")
		escreva("\n Kart N", kartMaisgg)
   		escreva("\n Modelo: ",modelokart[kartMaisgg])
   		escreva("\n Valor de locacao: ",valorKart[kartMaisgg])
   		escreva("\n Quantidade de locacoes: ", qntdVezLockart[kartMaisgg])
   		
   		escreva("\nAperte uma tecla para voltar ao menu!")
   		leia(ok)
   
	}

	//Receita e lucro do dia 
	funcao ReceitaLucroDia(){
		escreva("\n O faturamento do dia ", data, ", é: ", faturamentoDia, ".")
   		escreva("\n O lucro do dia ", data, ", considerando que karts geram 30%")
   		escreva("\n e circuitos 70% de lucro é: ", lucroDia, ".")
   		escreva("\n Sendo ", lucroCircuito, ", o lucro com circuito.")
   		escreva("\n Sendo ", lucroKart, ", o lucro com karts alugados.")

   		
   		escreva("\nAperte uma tecla para voltar ao menu!")
   		leia(ok)
		   	
	}

	//Alugar Circuito
	funcao alugarCircuirto(){

			inteiro repetir2 = 1
			enquanto(valorDoCircuito == 0.0){
				escreva("\nAlUGUEL DO CIRCUITO. ")
				escreva("\nQual o valor de locacao do circuito?")
      			leia(valorDoCircuito)	
			}
			
			limpa()

			enquanto(repetir2 == 1){
   				escreva("\nALUGUEL DO CIRCUITO: ")
   				escreva("\nPara alugar o circuito, o valor atual é: " ,valorDoCircuito, ".")
      			escreva("\nDeseja alugar? Responda com SIM OU NAO.")
      			leia(queroAlugarCircuito)
   				se(queroAlugarCircuito == "SIM" ou queroAlugarCircuito == "NAO"){
   					repetir2 = -1	
   				}senao{
   					repetir2 = 1
   				}	

   			} 			

   			limpa()

   			se(queroAlugarCircuito == "SIM"){
   				lucroCircuito = valorDoCircuito * 0.7
      			lucroDia = lucroDia + lucroCircuito
      			faturamentoDia = faturamentoDia + valorDoCircuito	
      			escreva("\nCIRCUITO ALUGADO. ")
   			}

   			escreva("\nAperte uma tecla para voltar ao menu!")
   			leia(ok)
			
	}

	

	// Atualizar Data
	funcao atualizarData(){

		cadeia prolongarAluguel = ""
		inteiro repetir3 = 1

		limpa()
		escreva("\nAtualizaçao da data")
		escreva("\nA data atual é: ", data, ".")
		escreva("\nQual a nova data? ")
		leia(data)

		valorDoCircuito = 0.0
   		faturamentoDia = 0.0
   		lucroDia = 0.0
   		lucroCircuito = 0.0
   		lucroKart = 0.0

   		limpa()
   		escreva("\nA nova data é: ", data, ".")
   		escreva("\nO circuito agora encontra-se disponível para a locacao.")
   		queroAlugarCircuito = "X"

   		escreva("\nDeseja prolongar o aluguel dos karts já locados? ")

   		para(i = 1; i <=k; i++){
			se(seKartloc[i] == "SIM"){
				escreva("\n Kart N",i)
        			escreva("\n Modelo: ",modelokart[i])
         			escreva("\n Valor de locacao: ",valorKart[i])
         			escreva("\n Quantidade de locacoes: ", qntdVezLockart[i])


				enquanto(repetir3 == 1){
   					escreva("\nDeseja prolongar o aluguel desse kart? Responda com SIM ou NAO: ")
   					leia(prolongarAluguel)
   				se(prolongarAluguel == "SIM" ou prolongarAluguel == "NAO"){
   					repetir3 = -1	
   				}senao{
   					repetir3 = 1
   				}	
			
   			} 

   				se(prolongarAluguel == "SIM"){
   					escreva("\nAluguel prolongado. ")
   					lucroKart =  valorKart[i] * 0.3
            			lucroDia = lucroDia + lucroKart
            			faturamentoDia = faturamentoDia + valorKart[i]
            			qntdVezLockart [i] = qntdVezLockart[i] + 1	
   				}

   				se(prolongarAluguel == "NAO"){
   					escreva("\nKart devolvido ")
   					seKartloc[i] = "NAO"
   				}

			}	
			
   			
   			escreva("\nAperte uma tecla para voltar ao menu!")
   			leia(ok)
   		}
   		
	}
	
	
	funcao inicio(){
		inteiro denovo = 1
	
		enquanto(denovo == 1){
	 		menu()

			escolha(opc){
		
		caso 1:
		
      		se(opc == 1){
      			se(k > 15){
         				escreva("Nao e possivel cadastrar mais que 15 karts!")
         				escreva("\nAperte uma tecla para voltar ao menu!")
         				leia(ok)
      			}senao{
         				cadastrarKart()
      			}	
      		}

      	caso 2: 

      		se(opc == 2){
      			se(k >= 1){
   					listarKartsDisp()   			
      			}senao{
      				limpa()
      				escreva("E preciso ter pelo menos um kart cadastrado.")
         				escreva("\nAperte uma tecla para retornar ao menu.")
         				leia(ok)	
      			}	
      		}

      	caso 3:
			se(opc == 3){
      			se(k >= 1){
        		 		listarKartsLocados()	
      			}senao{
         				limpa()
         				escreva("E preciso ter pelo menos um kart alugado.")
         				escreva("\nAperte uma tecla para retornar ao menu.")
         				leia(ok)
      			}
				
			}

		caso 4:
			se(opc == 4){
				se(k >= 1){
					alugarKart()	
				}senao{
					limpa()
					escreva("Ainda não há karts cadastrados.")
        			 	escreva("\nAperte uma tecla para voltar ao menu.")
         				leia(ok)	
				}
			}
      			
      	caso 5: 
      		se(opc == 5){
      			se(k >= 1){
      				devolverKart()	
      			}senao{
      				limpa()
      				escreva("Ainda não há karts alugados.")
         				escreva("\nAperte uma tecla para voltar ao menu.")
         				leia(ok)	
      			}	
      		}

      	caso 6: 
      		se(opc == 6){
      			se(k >= 1){
      				kartMaiorGanho()
      			}senao{
      				limpa()
      				escreva("\n É preciso ter pelo menos um kart cadastrado")
      				escreva("\nAperte uma tecla para voltar ao menu.")
      				leia(ok)	
      			}	
      		}


      	caso 7:
      		se(opc == 7){
      			ReceitaLucroDia()
      		}
   		
		caso 8: 
			se(opc == 8){
				se(k >= 1){
					alugarCircuirto()	
				}senao{
				limpa()
      			escreva("\nE preciso ter um kart alugado.")
      			escreva("\nAperte uma tecla para voltar ao menu.")
      			leia(ok)		
			}
			
		}

		caso 9: 
			se(opc == 9){
				se(k >= 1){
					atualizarData()	
				}senao{
					limpa()
      				escreva("Ainda não tem nenhum Kart alugado")
      				escreva("\nAperte uma tecla para voltar ao menu.")
      				leia(ok)	
				}	
			}

		caso 10:
			se(opc == 10){
      			escreva("Obrigado por utilizar o nosso sistema")
      			escreva("\nEspero que tenha achado um bom e útil sistema.")
      			denovo = -1
			} 
   
		//chave escolha	
		}

		//chave enquanto	
	 	}

		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 173; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i, 10, 14, 1}-{qntdVezLockart, 14, 26, 14}-{seKartloc, 15, 29, 9}-{modelokart, 15, 44, 10}-{kartMaisgg, 179, 10, 10};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, cadeia, caracter;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */