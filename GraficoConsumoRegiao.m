%% Função para criar um gráfico de consumo por região
function grafico= GraficoConsumoRegiao(dados, inicio, fim)

  %% Dados para o gráfico de barras
  nomes = {"Norte", "Centro-Oeste", "Nordeste", "Sul", "Sudeste"};
  norte= sum(reshape(dados{1}, 1, []));
  nordeste= sum(reshape(dados{2}, 1, []));
  sudeste= sum(reshape(dados{3}, 1, []));
  sul= sum(reshape(dados{4}, 1, []));
  centro= sum(reshape(dados{5}, 1, []));
  valores= [norte, centro, nordeste, sul, sudeste];

  %% Define a paleta de cores
  cores = {[102/255, 102/255, 102/255], [171/255, 46/255, 254/255], [1/255, 138/255, 128/255], [254/255, 8/255, 45/255], [0/255, 121/255, 254/255]};

  %% Criar o gráfico de barras horizontais
  figure("Position", [100, 100, 1300, 400]);
  hold on;

  for i = 1:length(nomes)
      barh(i, valores(i), 0.35, "FaceColor", cores{i});

      %% Adicionar rótulos aos eixos
      yticks(1:length(nomes)); % Definir os ticks do eixo y
      yticklabels(nomes); % Definir os rótulos do eixo y
      xticks(linspace(0,4000000000,21));
      xticklabels({"0,0 Mi", "0,2 Mi", "0,4 Mi", "0,6 Mi", "0,8 Mi", "1,0 Mi", "1,2 Mi", "1,4 Mi", "1,6 Mi", "1,8 Mi", "2,0 Mi", "2,2 Mi", "2,4 Mi", "2,6 Mi", "2,8 Mi", "3,0 Mi", "3,2 Mi", "3,4 Mi", "3,6 Mi", "3,8 Mi", "4,0 Mi"});
      titulo= sprintf("CONSUMO ACUMULADO POR REGIAO EM GWH: %s - %s", inicio, fim);
      title(titulo);

      %% Adicionar valores das barras formatados ao lado delas
      texto = sprintf("%.2f Mi", valores(i)/1000000000);
      text(valores(i)+10000000, i, texto, "VerticalAlignment", "middle", "HorizontalAlignment", "left");
  end
  hold off;

  %% Adicionar grades ao gráfico
  grid on;

  %% Salva arquivo
  print("grafico_consumo_regiao.png", "-dpng", "-r1000");

endfunction



