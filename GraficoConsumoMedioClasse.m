%% Função para criar o gráfico de Consumo Médio por classe
function grafico= GraficoConsumoMedioClasse(dados, inicio, fim)

  %% Dados para o gráfico de pizza
  nomes = {"Outros", "Comercial", "Residêncial", "Industrial"};
  residencial= sum(reshape(dados{1}, 1, []));
  industrial= sum(reshape(dados{2}, 1, []));
  comercial= sum(reshape(dados{3}, 1, []));
  outros= sum(reshape(dados{4}, 1, []));
  valores = [outros, comercial, residencial, industrial];

  %% Calcula as porcentagens
  porcentagens= 100*valores/sum(valores);

  %% Adiciona porcentagens aos rótulos
  for i = 1:length(nomes)
      nomes{i} = sprintf('%s\n%.2f%%', nomes{i}, porcentagens(i));
  end

  %% Define a paleta de cores
  cores = [255/255, 192/255, 0/255 ;112/255, 173/255, 70/255; 237/255, 125/255, 49/255; 150/255, 77/255, 32/255];

  %% Criação do gráfico de pizza
  fig= figure;
  pie(valores, nomes);
  colormap(cores);
  texto= sprintf("CONSUMO MÉDIO POR CLASSE: %s - %s", inicio, fim);
  title(texto);

  %% Adicionar círculo no centro para criar o efeito de donut
  hold on;
  t = 0:0.01:2*pi;
  x = 0.65*cos(t);
  y = 0.65*sin(t);

  %% Adicionar toda a área central
  fill(x, y, 'w');
  plot(x, y, 'w', 'LineWidth', 2);
  hold off;

  %% Salva arquivo
  print("grafico_consumo_medio_classe.png", "-dpng", "-r1000");

endfunction
