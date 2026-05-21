clc; clear all;

cor = 'vermelho';

if strcmp(cor, 'amarelo')
       
    H_min = 0.10;
    H_max = 0.20;
    

elseif strcmp(cor, 'azul')
       
    H_min = 0.55;
    H_max = 0.75;
    


elseif strcmp(cor, 'verde')
       
    H_min = 0.25;
    H_max = 0.45;
    


elseif strcmp(cor, 'vermelho')
       
    H_min = 0.05;
    H_max = 0.95;
    
end


for i = 1:6
    nome = sprintf('%d.jpeg', i);
    img = imread(nome);
    
    hsv = rgb2hsv(img);
    H = hsv(:,:,1);
    S = hsv(:,:,2);
    V = hsv(:,:,3);
    
    if strcmp(cor, 'vermelho')
        
        
        mascara = (H < H_min | H > H_max) & (S > 0.4) & (V > 0.4);
        
    else
        mascara = (H > H_min & H < H_max) & (S > 0.4) & (V > 0.4);
    end   
    
    quantidade = sum(mascara(:));
    
    if quantidade > 500
        fprintf('Imagem %d tem a cor escolhida\n', i);
    end
end