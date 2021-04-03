library(dplyr)
#2020
caged_2020_1 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202001.txt")
caged_2020_2 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202002.txt")
caged_2020_3 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202003.txt")
caged_2020_4 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202004.txt")
caged_2020_5 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202005.txt")
caged_2020_6 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202006.txt")
caged_2020_7 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202007.txt")
caged_2020_8 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202008.txt")
caged_2020_9 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202009.txt")
caged_2020_10 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202010.txt")
caged_2020_11 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202011.txt")
caged_2020_12 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202012.txt")
#2021
caged_2021_1 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202101.txt")
caged_2021_2 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202102.txt")


caged = caged_2020_2

RN = filter(caged, uf==24)

micro = filter(RN, tamestabjan == 1 | tamestabjan == 2 |
                   tamestabjan == 3 | tamestabjan == 4 )

pequena = filter(RN, tamestabjan == 5 | tamestabjan == 6)

media = filter(RN, tamestabjan == 7 | tamestabjan == 8)

grande = filter(RN, tamestabjan == 9 | tamestabjan == 10)

nao_identificado = filter(RN, tamestabjan == 99)

sum(micro$saldomovimentaÃ.Ã.o)
sum(pequena$saldomovimentaÃ.Ã.o)
sum(media$saldomovimentaÃ.Ã.o)
sum(grande$saldomovimentaÃ.Ã.o)
sum(nao_identificado$saldomovimentaÃ.Ã.o)

sum(RN$saldomovimentaÃ.Ã.o)

Agro = filter(micro, seÃ.Ã.o=="A")
Industria = filter(micro, seÃ.Ã.o=="B" | seÃ.Ã.o=="C" | seÃ.Ã.o=="D" | seÃ.Ã.o=="E")
Construcao = filter(micro, seÃ.Ã.o=="F")
Comercio = filter(micro, seÃ.Ã.o=="G")
Servicos = filter(micro, seÃ.Ã.o=="H" | seÃ.Ã.o=="I" | seÃ.Ã.o=="J" | seÃ.Ã.o=="K" |
                         seÃ.Ã.o=="L" | seÃ.Ã.o=="M" | seÃ.Ã.o=="N" | seÃ.Ã.o=="O" |
                         seÃ.Ã.o=="P" | seÃ.Ã.o=="Q" | seÃ.Ã.o=="R" | seÃ.Ã.o=="S" |
                         seÃ.Ã.o=="T" | seÃ.Ã.o=="U")
Nenhum = filter(micro, seÃ.Ã.o=="Z")

sum(Agro$saldomovimentaÃ.Ã.o)
sum(Industria$saldomovimentaÃ.Ã.o)
sum(Construcao$saldomovimentaÃ.Ã.o)
sum(Comercio$saldomovimentaÃ.Ã.o)
sum(Servicos$saldomovimentaÃ.Ã.o)
sum(Nenhum$saldomovimentaÃ.Ã.o)

