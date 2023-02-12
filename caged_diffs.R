library(dplyr)

caged_1_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/1/CAGEDEXC202201.txt")
caged_1_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/1/CAGEDFOR202201.txt")

caged_2_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/2/CAGEDEXC202202.txt")
caged_2_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/2/CAGEDFOR202202.txt")

caged_3_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/3/CAGEDEXC202203.txt")
caged_3_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/3/CAGEDFOR202203.txt")

caged_4_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/4/CAGEDEXC202204.txt")
caged_4_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/4/CAGEDFOR202204.txt")

caged_5_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/5/CAGEDEXC202205.txt")
caged_5_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/5/CAGEDFOR202205.txt")

caged_6_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/6/CAGEDEXC202206.txt")
caged_6_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/6/CAGEDFOR202206.txt")

caged_7_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/7/CAGEDEXC202207.txt")
caged_7_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/7/CAGEDFOR202207.txt")

caged_8_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/8/CAGEDEXC202208.txt")
caged_8_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/8/CAGEDFOR202208.txt")

caged_9_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/9/CAGEDEXC202209.txt")
caged_9_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/9/CAGEDFOR202209.txt")

caged_10_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/10/CAGEDEXC202210.txt")
caged_10_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/10/CAGEDFOR202210.txt")

caged_11_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/11/CAGEDEXC202211.txt")
caged_11_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/11/CAGEDFOR202211.txt")

caged_12_exc = read.csv2("C:/Users/Lhayana/Downloads/CAGED/12/CAGEDEXC202212.txt")
caged_12_for = read.csv2("C:/Users/Lhayana/Downloads/CAGED/12/CAGEDFOR202212.txt")

exclusoes = list(caged_1_exc, caged_2_exc, caged_3_exc, caged_4_exc, caged_5_exc, caged_6_exc, caged_7_exc, caged_8_exc, caged_9_exc, caged_10_exc, caged_11_exc, caged_12_exc)
foras = list(caged_1_for, caged_2_for, caged_3_for, caged_4_for, caged_5_for, caged_6_for, caged_7_for, caged_8_for, caged_9_for, caged_10_for, caged_11_for, caged_12_for)

meses = list(202201,202202,202203,202204,202205,202206,202207,202208,202209,202210,202211,202212)
meses=as.integer(meses)
diffs_meses=list()
foras_meses=list()
exc_meses=list()

for(mes in meses){
  total_exc=0
  total_foras=0
  diff=0

      for (i in exclusoes){
        NEexc = filter(i, região==2)
        NEexc = filter(NEexc, competênciamov==mes)
        total_exc=total_exc+(sum(NEexc$saldomovimentação))
      }
    
      for (i in foras){
        NEfor = filter(i, região==2)
        NEfor = filter(NEfor, competênciamov==mes)
        total_foras=total_foras+(sum(NEfor$saldomovimentação))
      }
      
  diff = total_foras-total_exc
  diffs_meses = append(diffs_meses, diff)
  foras_meses=append(foras_meses, total_foras)
  exc_meses=append(exc_meses, total_exc)
  }

print(diffs_meses)
