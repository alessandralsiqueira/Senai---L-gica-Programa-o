programa
{
	inclua biblioteca Tipos 
	inclua biblioteca Matematica 

	inteiro quantidadeProduto, linha, coluna, totalColunas = 4, totalLinhas
	real converteAnual, mediaMensal, quantidadeEstoque, valorAtual, converteValorMedio, valorMedioConvertido
	cadeia nomeProduto, quantidadeAnual, valorMedio, nomeCompra
	cadeia matrizGeral[999][6]
	inteiro desejoContinuacao, num01 = 300
	logico achouProduto = falso
	caracter desejoUsuario
	 

	
	funcao inicio()
	{
		escreva("\nSeja bem-vindo a LISTA DE COMPRAS INTELIGENTE!!!")
		escreva("\nAqui você cadastra seus itens e nós te falamos se deve ou não comprar naquele momento. \n\n")
		
		opcaoUsuario()
		
	}

	funcao opcaoUsuario()
	{
		escreva("-------------------------------------------------------","\n")	
		escreva("O que você deseja fazer? \nDigite [1] para CADASTRAR PRODUTOS \nDigite [2] REALIZAR COMPRA \nDigite [3] para SAIR DO SISTEMA\n")
			leia(desejoUsuario)
		escreva("-------------------------------------------------------","\n")	

		escolha(desejoUsuario)
		{
			caso '1':
				cadastro()
				escreva("Função CADASTRAR PRODUTOS escolhida.\n")
				pare
			caso '2':
				compra()
				escreva("Função COMPRA escolhida.\n")
				pare
			caso '3':
				sair()
				escreva ("Sistema ENCERRADO. Estamos à sua disposição quando desejar!")
				pare
			caso contrario:
		 		escreva("Opção Inválida!!! Tente novamente.")
		 		pare
		}
	}

	funcao cadastro ()
	{
			totalColunas = 4
			escreva("\nInforme a QUANTIDADE de produtos que deseja cadastrar nesse momento: \n")
				leia(quantidadeProduto)
			
			para(linha = 0; linha < quantidadeProduto; linha++)
			{
				para(coluna = 0; coluna < totalColunas; coluna++)
				{
					escreva("\nInforme o NOME do produto: \n")
						leia(nomeProduto)
						matrizGeral[linha][coluna] = nomeProduto
						coluna++
					escreva("\nInforme a QUANTIDADE anual que consome: \n")
						leia(quantidadeAnual)
						matrizGeral[linha][coluna] = quantidadeAnual
						coluna++
					escreva("\nInforme a VALOR MÉDIO do produto: \n")
						leia(valorMedio)
						matrizGeral[linha][coluna] = valorMedio
						coluna++
					
				}
			}
		para(linha = 0; linha < quantidadeProduto; linha++)
		{		
			converteAnual = Tipos.cadeia_para_real(matrizGeral[linha][1])
			mediaMensal = converteAnual / 12
			mediaMensal = Matematica.arredondar(mediaMensal, 1)
			escreva("\n\nA média mensal é de: ", mediaMensal, "\n")
		}
	
		para(linha = 0; linha < quantidadeProduto; linha++)
		{
			converteValorMedio = Tipos.cadeia_para_real(matrizGeral[linha][2])
			valorMedioConvertido = converteValorMedio
			escreva("\n\nO valor médio informado para o produto é de: ", valorMedioConvertido, "\n")
		}
		opcaoUsuario()
	}

	funcao compra ()
	{
		escreva("Informe o NOME DO PRODUTO que deseja comprar: \n")
			leia(nomeCompra)	
			
			para (linha = 0; linha < quantidadeProduto; linha++)
			{
				para(coluna = 0; coluna < totalColunas; coluna++)
				{
					se (matrizGeral[linha][coluna] == nomeCompra)
					{
						achouProduto = verdadeiro
						escreva("Informe a QUANTIDADE desse produto que você possui no ESTOQUE: \n")
							leia(quantidadeEstoque)
						escreva("Informe o VALOR ATUAL do produto: \n")
							leia(valorAtual)
						converte()
						decisao()
						opcaoUsuario()
					}
					senao
					{
						faltaCadastro()
					}
				}
			}

			
	}
					
			funcao converte()
			{
				para(linha = 0; linha < quantidadeProduto; linha++)
				{		
					converteAnual = Tipos.cadeia_para_real(matrizGeral[linha][1])
					mediaMensal = converteAnual / 12
					converteValorMedio = Tipos.cadeia_para_real(matrizGeral[linha][2])
					valorMedioConvertido = converteValorMedio
				}
			}


			funcao decisao ()
			{
				para(linha = 0; linha < quantidadeProduto; linha++)
				{
					//converte()
					se(quantidadeEstoque < mediaMensal e valorAtual < valorMedioConvertido)
					{
						escreva("Você está com estoque BAIXO do produto.\n")
						escreva("Além disso o produto está com VALOR ACESSÍVEL.\n")
						escreva("Você deve COMPRAR O PRODUTO AGORA MESMO.\n")
						pare
					}
					senao se(quantidadeEstoque < mediaMensal e valorAtual == valorMedioConvertido)
					{
						escreva("Você está com estoque BAIXO do produto.\n")
						escreva("O produto está com VALOR MÉDIO ESTÁVEL.\n")
						escreva("Você deve COMPRAR O PRODUTO agora mesmo.\n")
						pare
					}
					senao se(quantidadeEstoque < mediaMensal e valorAtual > valorMedioConvertido)
					{
						escreva("Você está com estoque BAIXO do produto.\n")
						escreva("O produto está com VALOR MÉDIO ACIMA do geralmente praticado.\n")
						escreva("Você deve COMPRAR O PRODUTO assim que for POSSÍVEL dentro das condições financeiras que possui.\n")
						pare
					}
					senao se(quantidadeEstoque > mediaMensal e valorAtual < valorMedioConvertido)
					{
						escreva("Você está com estoque ALTO do produto.\n")
						escreva("O produto está com VALOR MÉDIO ABAIXO do geralmente praticado.\n")
						escreva("Dessa forma, recomendamos COMPRAR O PRODUTO para ECONOMIZAR recursos financeiros.\n")
						pare
					}
					senao se(quantidadeEstoque > mediaMensal e valorAtual == valorMedioConvertido)
					{
						escreva("Você está com estoque ALTO do produto.\n")
						escreva("O produto está com VALOR MÉDIO ESTÁVEL do geralmente praticado.\n")
						escreva("Dessa forma, você SÓ DEVE COMPRAR o produto se houver alguma necessidade específica.\n")
						pare
					}
					senao se(quantidadeEstoque > mediaMensal e valorAtual > valorMedioConvertido)
					{
						escreva("Você está com estoque ALTO do produto.\n")
						escreva("O produto está com VALOR MÉDIO ACIMA do geralmente praticado.\n")
						escreva("Dessa forma, recomendamos NÃO COMPRAR O PRODUTO.\n")
						pare
					}
					senao se(quantidadeEstoque == mediaMensal e valorAtual < valorMedioConvertido)
					{
						escreva("Você está com estoque NORMAL do produto.\n")
						escreva("O produto está com VALOR MÉDIO BAIXO em relação ao geralmente praticado.\n")
						escreva("Dessa forma, recomendamos COMPRAR O PRODUTO para ECONOMIZAR recursos financeiros.\n")
						pare
					}
					senao se(quantidadeEstoque == mediaMensal e valorAtual == valorMedioConvertido)
					{
						escreva("Você está com estoque NORMAL do produto.\n")
						escreva("O produto está com VALOR MÉDIO ESTÁVEL em relação ao geralmente praticado.\n")
						escreva("Dessa forma, você SÓ DEVE COMPRAR o produto se houver alguma necessidade específica.\n")
						pare
					}
					senao se(quantidadeEstoque == mediaMensal e valorAtual > valorMedioConvertido)
					{
						escreva("Você está com estoque NORMAL do produto.\n")
						escreva("O produto está com VALOR MÉDIO ACIMA do valor geralmente praticado.\n")
						escreva("Dessa forma, você NÃO DEVE COMPRAR o produto.\n")
						pare
					}
				}
			}

	 
		funcao faltaCadastro ()
		{
			se(achouProduto == falso)
			{
				escreva("\nProduto NÃO cadastrado. Primeiro você deve cadastrar o produto. \n")
				opcaoUsuario()
			}
			opcaoUsuario()
		}


		funcao sair()
		{
			escreva ("Sistema ENCERRADO. Estamos à sua disposição quando desejar!")
			
		}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 992; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matrizGeral, 9, 8, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */