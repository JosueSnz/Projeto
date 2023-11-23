%% Função para criar um arquivo
function criar= Cria_arquivo(vetor, inicio, fim)

  %% Meses
  datas = {};
  while inicio <= fim
   datas = [datas; datestr(inicio, "mm/yyyy")];
   vetor_data = datevec(inicio);
   vetor_data(2) = vetor_data(2) + 1;
   inicio = datenum(vetor_data);
  end

  %% Cria a estrutura de dados
  dados= cell(1,length(datas));

  %% Adiciona valores
  for i= 1:length(datas)
    dados{i} = struct("Data", datas{i}, "Valor", vetor(i));
  endfor

  %% Salva o arquivo
  save("consumo_total.mat", "dados");

endfunction


