programa
{
	
     inclua biblioteca Util --> u
	logico quartosInternacao[20] = {falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso,falso}
	real totalConsultas = 0.0, totalInternacoes = 0.0
	inteiro internacoes = 0, totalPessoasConsultadas = 0
	
	funcao inicio()
     {
		logico sairMenu = falso
		inteiro respostaMenu = 0
		enquanto (nao sairMenu)
		{
			criarMenu()
			leia(respostaMenu)

			se(respostaMenu == 5){
				sairMenu = verdadeiro
			} senao se (respostaMenu == 1){
				consulta()
			}senao se (respostaMenu == 2){
				internacao()
			
			}senao se (respostaMenu == 3){
				listagemQuartos()
			}senao{
				faturamento()
			}
			
		}
	}

	funcao criarMenu()
	{
		escreva("HOSPITAL - CAILLEAUX")
		escreva("\n")
		escreva("--------------------")
		escreva("\n")
		escreva("1 - Consulta Ambulatorial")
		escreva("\n")
		escreva("2 - Internação")
		escreva("\n")
		escreva("3 - Listar quartos")
		escreva("\n")
		escreva("4 - Faturamento")
		escreva("\n")
		escreva("5 - Sair do programa")
		escreva("\n")
		escreva("--------------------")
		escreva("\n")
	}

	funcao consulta()
	{
		cadeia nome, telefone, tipoConsulta

		escreva("Digite seu nome: ")
		leia(nome)

		escreva("Digite seu telefone: ")
		leia(telefone)

		escreva("Digite a especialidade da sua consulta: ")
		leia(tipoConsulta)

		real valorConsulta
		se (tipoConsulta == "Pediatria" ou tipoConsulta == "pediatria")
		{	valorConsulta = 150.0
			escreva("Consulta marcada com sucesso\n Valor:R$150,00")
			u.aguarde(3000)
			
		} senao {
			valorConsulta = 120.0
			escreva("Consulta marcada com sucesso\n Valor:R$120,00")
			u.aguarde(3000)
		}

		totalConsultas = totalConsultas + valorConsulta
		totalPessoasConsultadas++

		limpa()
	}
 	funcao internacao()
	{
 		cadeia telefone, nome
 		inteiro idade

 		escreva("Internação\n---Ficha do paciente---\nNome:")
 		leia(nome)
 		escreva("Idade: ")
 		leia(idade)
 		escreva("Telefone: ")
 		leia(telefone)

		reservarQuarto(nome)
	}
	funcao reservarQuarto(cadeia nome)
	{
		inteiro quarto=0 
		escreva("Digite o número do quarto desejado:(entre 1 e 20):")
		leia(quarto)
		se (quartosInternacao[quarto-1] == falso){
			quartosInternacao[quarto-1] = verdadeiro
			escreva("Cadastro realizado com sucesso! \nQuarto:", quarto, "Paciente:\n", nome, "Valor: R$500,00\n")
			totalInternacoes = totalInternacoes + 500.00
			internacoes++
			limpa()
			
		}senao{
			escreva("Quarto Indisponível!")
			u.aguarde(2000)
			limpa()
			reservarQuarto(nome)
		}
		
	}
	funcao listagemQuartos()
	{
		inteiro opcao
		escreva("---Listagem de quartos---\n")
		para( inteiro i = 0; i < 20; i++){
			escreva("Quarto:", i, "\n")
	
			se (quartosInternacao[i] == falso){
				escreva("Dísponivel!\n")
				u.aguarde(100)
			}senao{
				escreva("Ocupado!\n")
				u.aguarde(100)
			}
		}
	
			escreva("----------\n1-Repetir listagem\n2-Sair\n-------------Digite a opção desejada:")
			leia(opcao)
			se(opcao == 1){
				listagemQuartos()
				
			}senao{
				escreva("Voltando ao menu!\n")
				u.aguarde(2000)
				limpa()
		}
	}	
	funcao faturamento()
	{
		inteiro opcao
		escreva("Número total de consultas:", totalPessoasConsultadas, "\n")
		escreva("Número de internações:", internacoes, "\n")
		escreva("Valor total:", totalConsultas + totalInternacoes,"\n")
		escreva("Valor arrecadado das consultas:", totalConsultas,"\n")
		escreva("Valor arrecadado das internações:", totalInternacoes,"\n")
		
		u.aguarde(2000)
		escreva("-------------------1-Repetir Faturamento\n")
		escreva("-------------------2-Sair\n")
		leia(opcao)

		se (opcao == 1){
		faturamento()
		}senao{
			escreva("Voltando ao menu!")
			u.aguarde(2000)
			limpa()
		}
		
		
	}
	}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1841; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */