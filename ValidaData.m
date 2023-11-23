%% Função para validar a data inserida
function valorValido= ValidaData(x)

  try
     %% Verifica se a data é validar
     datenum(x, "mm/yyyy");

     %% Verifica se a data esta dentro do período
     datalimitemin= datenum("12/2003", "mm/yyyy");
     datalimitemax= datenum("10/2023", "mm/yyyy");
     data= datenum(x, "mm/yyyy");

     valorValido = data>datalimitemin && data<datalimitemax;
  catch
    %% Se ocorrer um erro na conversão, a data é inválida
    valorValido = false;
  end
endfunction
