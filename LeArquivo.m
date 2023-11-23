%% Função para ler o excel no período determinado
function arquivo= LeArquivo(inicio, fim)

  %% Pacote utilizado
  pkg load io;

  %% Ler a planilha
  dadosT= xlsread("CONSUMO MENSAL DE ENERGIA ELÉTRICA POR CLASSE.xls", 'TOTAL');
  dadosR= xlsread("CONSUMO MENSAL DE ENERGIA ELÉTRICA POR CLASSE.xls", 'RESIDENCIAL');
  dadosI= xlsread("CONSUMO MENSAL DE ENERGIA ELÉTRICA POR CLASSE.xls", 'INDUSTRIAL');
  dadosC= xlsread("CONSUMO MENSAL DE ENERGIA ELÉTRICA POR CLASSE.xls", 'COMERCIAL');
  dadosO= xlsread("CONSUMO MENSAL DE ENERGIA ELÉTRICA POR CLASSE.xls", 'OUTROS');

  %% data inicial e data final

  %% Separa a data para processamento
  di = strsplit(inicio, '/');
  mesi= di{1};
  mesi= str2num(mesi);
  anoi= di{2};
  anoi= str2num(anoi);

  %% Separa a data para processamento
  df = strsplit(fim, '/');
  mesf= df{1};
  mesf= str2num(mesf);
  anof= df{2};
  anof= str2num(anof);

  %% Formula para encontra a linha/coluna correta
  linhai= ((2023-anoi)*16)+1;
  linhaf= ((2023-anof)*16)+1;

  %% consumo mensal total (campo consumo_total)
  consumo_total= dadosT(linhai:-16:linhaf, 1:12);
  consumo_total(1,1:mesi-1)=0;
  consumo_total(end, mesf+1:end)=0;
  consumo_total= reshape(consumo_total', 1, []);
  consumo_total= nonzeros(consumo_total);
  consumo_total= consumo_total';

  %% consumo mensal por região (crie um campo para cada região– norte, sul, nordeste, sudeste e centro-oeste)
  consumo_norte= dadosT(2+linhai:-16:linhaf, 1:12);
  consumo_norte(1,1:mesi-1)=0;
  consumo_norte(end, mesf+1:end)=0;
  consumo_nordeste= dadosT(3+linhai:-16:linhaf, 1:12);
  consumo_nordeste(1,1:mesi-1)=0;
  consumo_nordeste(end, mesf+1:end)=0;
  consumo_sudeste= dadosT(4+linhai:-16:linhaf, 1:12);
  consumo_sudeste(1,1:mesi-1)=0;
  consumo_sudeste(end, mesf+1:end)=0;
  consumo_sul= dadosT(5+linhai:-16:linhaf, 1:12);
  consumo_sul(1,1:mesi-1)=0;
  consumo_sul(end, mesf+1:end)=0;
  consumo_centro= dadosT(6+linhai:-16:linhaf, 1:12);
  consumo_centro(1,1:mesi-1)=0;
  consumo_centro(end, mesf+1:end)=0;
  regiao= {consumo_norte, consumo_nordeste, consumo_sudeste, consumo_sul, consumo_centro};

  %% consumo mensal por classe (crie um campo para cada classe – residencial, industrial, comercial e outros)
  consumo_residencial= dadosR(linhai:-16:linhaf, 1:12);
  consumo_residencial(1,1:mesi-1)=0;
  consumo_residencial(end, mesf+1:end)=0;
  consumo_industrial= dadosI(linhai:-16:linhaf, 1:12);
  consumo_industrial(1,1:mesi-1)=0;
  consumo_industrial(end, mesf+1:end)=0;
  consumo_comercial= dadosC(linhai:-16:linhaf, 1:12);
  consumo_comercial(1,1:mesi-1)=0;
  consumo_comercial(end, mesf+1:end)=0;
  consumo_outros= dadosO(linhai:-16:linhaf, 1:12);
  consumo_outros(1,1:mesi-1)=0;
  consumo_outros(end, mesf+1:end)=0;
  classe= {consumo_residencial, consumo_industrial, consumo_comercial, consumo_outros};

  %% Cell
  dados= {consumo_total, regiao, classe};

  arquivo= dados;

endfunction
