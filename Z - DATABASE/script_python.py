import random

<<<<<<< HEAD
PRODUTOS = list(range(1, 500))
UF = ['AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO']
VALORES = list(range(10, 2500))

with open(r'C:\fontes_TDC2018\Z - DATABASE\script_sql.txt', 'wt') as arquivo:
    for i in range(0, 10000000):
=======
PRODUTOS = list(range(1, 1000))
UF = ['AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO']
VALORES = list(range(10, 2500))

with open(r'C:\fontes_TDC2018\DATABASE\script_sql.txt', 'wt') as arquivo:
    for i in range(1, 1000000):
>>>>>>> 5cd398086271ddc047306ff8607d14e6d3389a86
        produto = random.choice(PRODUTOS)
        uf = random.choice(UF)
        valor = random.choice(VALORES)
        arquivo.write("""INSERT INTO public."TB_VENDAS" ("ID_PRODUTO", "UF", "VALOR") VALUES ({}, '{}', {});\n""".format(produto, uf, valor))