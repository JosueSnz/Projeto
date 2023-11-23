%%------------------------------------------------------------------------
%% Autoria: Josué
%% Data: 21/11/2023
%% Descrição: Leitura de dados de consumo de energia e criação de gráficos

%% Limpar Área de trabalho
clear all;
close all;
clc;
%%------------------------------------------------------------------------

%% Entrada de dados e verificação

data_inicial= input("Data inicial (mm/aaaa): ", "s");
%% Verifica valor data_inicial
while ~ValidaData(data_inicial)
  clc;
  disp("Data inicial inválida.");
  data_inicial = input("Data inicial (mm/aaaa): ", "s");
end
clc;

data_final= input("Data final (mm/aaaa): ", "s");
%% Verifica valor data_final
while ~ValidaData(data_final)
  clc;
  disp("Data final inválida.");
  data_final = input("Data final (mm/aaaa): ", "s");
end
clc;

%% Verifica valor inicial < valor final
while datenum(data_inicial, "mm/yyyy") >= datenum(data_final, "mm/yyyy")
  do
    clc;
    disp("A data final deve ser maior que a data inicial e também ser válida");
    data_inicial = input("Data inicial (mm/aaaa): ", "s");
    data_final = input("Data final (mm/aaaa): ", "s");
  until ValidaData(data_inicial) && ValidaData(data_final)
end
clc;

%% Armazena datas como valores
di= datenum(data_inicial, "mm/yyyy");
df= datenum(data_final, "mm/yyyy");

disp("Escolha o gráfico:");
disp("1 - Gráfico de consumo por região.");
disp("2 – Gráfico de consumo médio por classe.");
tipo_grafico= input("Opção: ", "s");

%% Verifica se o valor é numérico
while ~isnumeric(str2double(tipo_grafico))
  clc;
  disp("Valor inválido, digite novamente");
  disp("Escolha o gráfico:");
  disp("1 - Gráfico de consumo por região.");
  disp("2 – Gráfico de consumo médio por classe.");
  tipo_grafico = input("Opção: ", "s");
end

tipo_grafico = str2double(tipo_grafico);

%% Verifica se o valor inserido é válido
while tipo_grafico ~= 1 && tipo_grafico ~= 2
  clc;
  disp("Valor inválido, digite novamente");
  disp("Escolha o gráfico:");
  disp("1 - Gráfico de consumo por região.");
  disp("2 – Gráfico de consumo médio por classe.");
  tipo_grafico = input("Opção: ", "s");
  tipo_grafico = str2double(tipo_grafico);
end

%%------------------------------------------------------------------------

%% Ler dados do excel e criar arquivo com total do mês
leitura= LeArquivo(data_inicial,data_final);
Cria_arquivo(leitura{1},di,df);
load("consumo_total.mat");

%% Plotar graficos
if tipo_grafico == 1
  GraficoConsumoRegiao(leitura{2}, data_inicial, data_final);
else
  GraficoConsumoMedioClasse(leitura{3}, data_inicial, data_final);
endif
