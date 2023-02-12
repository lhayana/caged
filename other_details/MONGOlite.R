library(mongolite)

cx = mongo(collection = "col_alunos", db= "db_test", url = ('mongodb://localhost:27017'))
dados = cx$find()
