library(dplyr)

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

caged_2021_1 = read.csv2("C:/Users/pc/Documents/Caged Movimentações/CAGEDMOV202101.txt")

caged = caged_2021_1

RN = filter(caged, uf==24)

RN$salÃ.rio = as.numeric(RN$salÃ.rio)
RN$salÃ.rio = as.integer(RN$salÃ.rio)

sum(is.na(RN$salÃ.rio))
#sum((RN$salÃ.rio) == 0)
summary(RN$salÃ.rio)

faixa_salarial <- RN %>%
  dplyr::mutate(salÃ.rio = case_when(((salÃ.rio>0) & (salÃ.rio <= 1045)) ~ "Até 1 salário",
                                     ((salÃ.rio>1045) & (salÃ.rio<=2090))  ~ "Entre 1 e 2",
                                     ((salÃ.rio>2090) & (salÃ.rio<=5225))  ~ "Entre 2 e 5",
                                     ((salÃ.rio>5225) & (salÃ.rio<=10450))  ~ "Entre 5 e 10",
                                     salÃ.rio > 10450 ~ "Mais de 10",
                                     salÃ.rio == 0 ~ "Não Identificado"))
unique(faixa_salarial$salÃ.rio)

f1 = filter(faixa_salarial, salÃ.rio == "Até 1 salário")
f2 = filter(faixa_salarial, salÃ.rio == "Entre 1 e 2")
f3 = filter(faixa_salarial, salÃ.rio == "Entre 2 e 5")
f4 = filter(faixa_salarial, salÃ.rio == "Entre 5 e 10")
f5 = filter(faixa_salarial, salÃ.rio == "Mais de 10")
nao_identificado = filter(faixa_salarial, salÃ.rio == "Não Identificado")

sum(f1$saldomovimentaÃ.Ã.o)
sum(f2$saldomovimentaÃ.Ã.o)
sum(f3$saldomovimentaÃ.Ã.o)
sum(f4$saldomovimentaÃ.Ã.o)
sum(f5$saldomovimentaÃ.Ã.o)
sum(nao_identificado$saldomovimentaÃ.Ã.o)
