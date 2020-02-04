#Versão 1.0
#desenvolvido por Cid Felipe
#Data: 04/02/2020

#importando as bibliotecas necessarias
library(stringi)
library(stringr)
library(tidyverse)

#configurando o diretorio e o nome do arquivo
setwd("/Users/cidpa/Desktop/SIM/")
file = ("/Users/cidpa/Desktop/SIM/sim00a09.txt")

#importando os dados para o dataset chamado my_data
my_data <- read.delim(file, sep = ";", header = TRUE, quote="'\"")

#retira acentuação, separa o primeiro e ultimo nome
my_data = my_data %>% 
  mutate(NOME_TRATADO <- stri_trans_general(my_data$NOME, "Latin-ASCII"),
         first_name <- str_extract(my_data$NOME_TRATADO, "\\w+"),
         last_name<-str_extract(my_data$NOME_TRATADO, '[^ ]+$'))

#exporta os dados para um arquivo .txt separado por ;
write.table(my_data, "/Users/cidpa/Desktop/SIM/sim2000a2009.txt", row.names = FALSE, sep = ";", fileEncoding = "utf-8")