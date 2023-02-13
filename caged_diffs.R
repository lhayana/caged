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

micro_exc_list=list()
pequena_exc_list=list()
media_exc_list=list()
grande_exc_list=list()
nao_identificado_exc_list=list()

micro_for_list=list()
pequena_for_list=list()
media_for_list=list()
grande_for_list=list()
nao_identificado_for_list=list()


for(mes in meses){
  total_exc=0
  total_foras=0
  diff=0
  
  total_micro_exc=0
  total_pequena_exc=0
  total_media_exc=0
  total_grande_exc=0
  total_nao_identificado_exc=0
  
  total_micro_for=0
  total_pequena_for=0
  total_media_for=0
  total_grande_for=0
  total_nao_identificado_for=0
  
  for (i in exclusoes){
    #NEexc = filter(i, região==2)
    NEexc = filter(i, competênciamov==mes)
    total_exc=total_exc+(sum(NEexc$saldomovimentação))
    
    micro_exc = filter(NEexc, tamestabjan == 1 | tamestabjan == 2 | tamestabjan == 3 | tamestabjan == 4 )
    total_micro_exc=total_micro_exc+(sum(micro_exc$saldomovimentação))
    
    pequena_exc = filter(NEexc, tamestabjan == 5 | tamestabjan == 6)
    total_pequena_exc=total_pequena_exc+(sum(pequena_exc$saldomovimentação))
    
    media_exc = filter(NEexc, tamestabjan == 7 | tamestabjan == 8)
    total_media_exc=total_media_exc+(sum(media_exc$saldomovimentação))
    
    grande_exc = filter(NEexc, tamestabjan == 9 | tamestabjan == 10)
    total_grande_exc=total_grande_exc+(sum(grande_exc$saldomovimentação))
    
    nao_identificado_exc = filter(NEexc, tamestabjan == 99)
    total_nao_identificado_exc=total_nao_identificado_exc+(sum(nao_identificado_exc$saldomovimentação))
    
  }
  
  for (i in foras){
    #NEfor = filter(i, região==2)
    NEfor = filter(i, competênciamov==mes)
    total_foras=total_foras+(sum(NEfor$saldomovimentação))
    
    micro_for = filter(NEfor, tamestabjan == 1 | tamestabjan == 2 | tamestabjan == 3 | tamestabjan == 4 )
    total_micro_for=total_micro_for+(sum(micro_for$saldomovimentação))
    
    pequena_for = filter(NEfor, tamestabjan == 5 | tamestabjan == 6)
    total_pequena_for=total_pequena_for+(sum(pequena_for$saldomovimentação))
    
    media_for = filter(NEfor, tamestabjan == 7 | tamestabjan == 8)
    total_media_for=total_media_for+(sum(media_for$saldomovimentação))
    
    grande_for = filter(NEfor, tamestabjan == 9 | tamestabjan == 10)
    total_grande_for=total_grande_for+(sum(grande_for$saldomovimentação))
    
    nao_identificado_for = filter(NEfor, tamestabjan == 99)
    total_nao_identificado_for=total_nao_identificado_for+(sum(nao_identificado_for$saldomovimentação))
    
  }
  
  diff = total_foras-total_exc
  diffs_meses = append(diffs_meses, diff)
  foras_meses=append(foras_meses, total_foras)
  exc_meses=append(exc_meses, total_exc)
  
  micro_exc_list=append(micro_exc_list, total_micro_exc)
  pequena_exc_list=append(pequena_exc_list, total_pequena_exc)
  media_exc_list=append(media_exc_list, total_media_exc)
  grande_exc_list=append(grande_exc_list, total_grande_exc)
  nao_identificado_exc_list=append(nao_identificado_exc_list, total_nao_identificado_exc)
  
  micro_for_list=append(micro_for_list, total_micro_for)
  pequena_for_list=append(pequena_for_list, total_pequena_for)
  media_for_list=append(media_for_list, total_media_for)
  grande_for_list=append(grande_for_list, total_grande_for)
  nao_identificado_for_list=append(nao_identificado_for_list, total_nao_identificado_for)
}

print(nao_identificado_for_list)
