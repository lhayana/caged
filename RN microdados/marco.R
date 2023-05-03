library(dplyr)

#movimentações de março
caged_3_mov = read.csv2("C:/Users/Lhayana/Downloads/caged23/CAGEDMOV202303.txt")

#filtrando dados do RN
rn_marco = filter(caged_3_mov, uf==24)

sum(rn_marco$saldomovimentação) #verificar se bate com o total da dash do MTE

#exportando para csv. Mudar o caminho.
write.csv2(rn_marco, file = "C:/Users/Lhayana/Downloads/caged23/rn_marco.csv")
