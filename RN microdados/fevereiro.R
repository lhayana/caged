library(dplyr)

#exclusões
caged_3_exc = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDEXC202303.txt")

#declarações fora do prazo
caged_3_for = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDFOR202303.txt")

#movimentações de fevereiro
caged_2_mov = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDMOV202302.txt")

#filtrando dados do RN e de fevereiro
caged_2_mov = filter(caged_2_mov, uf==24)

caged_3_for = filter(caged_3_for, uf==24)
caged_3_for = filter(caged_3_for, competênciamov==202302)

caged_3_exc = filter(caged_3_exc, uf==24)
caged_3_exc = filter(caged_3_exc, competênciamov==202302)

#unindo os dados das movimentações com as declarações fora do prazo
rn = rbind(caged_2_mov, caged_3_for)

#unindo dados das exclusões
excluir = caged_3_exc

#excluindo colunas que tem na base de exclusões mas não tem nas outras
colunas_todas = list(colnames(caged_2_mov))[[1]]
colnames(excluir)
colnames(excluir) %in% colnames(caged_2_mov)
###colnames(rn) %in% colnames(excluir)
excluir = select(excluir, -c(26, 27))

#tirando as linhas que devem ser excluídas
rn_fevereiro = anti_join(rn, excluir)

sum(rn_fevereiro$saldomovimentação) #verificar se bate com o total da dash do MTE

#exportando para csv. Mudar o caminho.
write.csv2(rn_fevereiro, file = "C:/Users/Lhayana/Downloads/caged23/rn_fevereiro.csv")
