library(dplyr)

caged_1 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202001.txt")
caged_2 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202002.txt")
caged_3 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202003.txt")
caged_4 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202004.txt")
caged_5 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202005.txt")
caged_6 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202006.txt")
caged_7 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202007.txt")
caged_8 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202008.txt")
caged_9 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202009.txt")
caged_10 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202010.txt")
caged_11 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202011.txt")
caged_12 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202012.txt")

caged = caged_12

mossoro = filter(caged, municÃ.pio == 240800)

micro = filter(mossoro, tamestabjan == 1 | tamestabjan == 2 |
                      tamestabjan == 3 | tamestabjan == 4 )

pequena = filter(mossoro, tamestabjan == 5 | tamestabjan == 6)

media = filter(mossoro, tamestabjan == 7 | tamestabjan == 8)

grande = filter(mossoro, tamestabjan == 9 | tamestabjan == 10)

nao_identificado = filter(mossoro, tamestabjan == 99)

sum(micro$saldomovimentaÃ.Ã.o)
sum(pequena$saldomovimentaÃ.Ã.o)
sum(media$saldomovimentaÃ.Ã.o)
sum(grande$saldomovimentaÃ.Ã.o)
sum(nao_identificado$saldomovimentaÃ.Ã.o)

