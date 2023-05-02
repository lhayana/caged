library(dplyr)

#exclusões
caged_2_exc = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDEXC202302.txt")
caged_3_exc = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDEXC202303.txt")

#declarações fora do prazo
caged_2_for = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDFOR202302.txt")
caged_3_for = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDFOR202303.txt")

#movimentações de janeiro
caged_1_mov = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDMOV202301.txt")

#filtrando dados do RN e de janeiro
caged_1_mov = filter(caged_1_mov, uf==24)

caged_2_for = filter(caged_2_for, uf==24)
caged_2_for = filter(caged_2_for, competênciamov==202301)

caged_3_for = filter(caged_3_for, uf==24)
caged_3_for = filter(caged_3_for, competênciamov==202301)

caged_2_exc = filter(caged_2_exc, uf==24)
caged_2_exc = filter(caged_2_exc, competênciamov==202301)

caged_3_exc = filter(caged_3_exc, uf==24)
caged_3_exc = filter(caged_3_exc, competênciamov==202301)

#unindo os dados das movimentações com as declarações fora do prazo
rn = rbind(caged_1_mov, caged_2_for, caged_3_for)

#unindo dados das exclusões
excluir = rbind(caged_2_exc, caged_3_exc)

#excluindo colunas que tem na base de exclusões mas não tem nas outras
colunas_todas = list(colnames(caged_1_mov))[[1]]
colnames(excluir)
colnames(excluir) %in% colnames(caged_1_mov)
###colnames(rn) %in% colnames(excluir)
excluir = select(excluir, -c(26, 27))

#selecionando as linhas que devem ser excluídas
inner = inner_join(excluir,rn)

#tirando as linhas que devem ser excluídas
rn_janeiro = anti_join(rn, inner)

sum(rn_janeiro$saldomovimentação) 
#se o saldo não bate, há linhas que foram excluídas por serem duplicadas

duplicated(inner) | duplicated(inner, fromLast = TRUE) #encontrando a linha duplicada

repetida = inner[16,] #adicionando a linha duplicada

rn_janeiro = rbind(rn_janeiro, repetida)

#exportando para csv. Mudar o caminho.
write.csv2(rn_janeiro, file = "C:/Users/Lhayana/Downloads/caged23/rn_janeiro.csv")
