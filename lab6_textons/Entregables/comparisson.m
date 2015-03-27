clear all; close all; clc

% Hisrograms num_imag x textones
load('test_hist.mat')
load('train_hist.mat')

% Busqueda de ceros
for i=1:size(Hist_train,1)
    for j=1:size(Hist_train,2)
    
        if Hist_train(i,j)==0
           Hist_train(i,j)=1e-10;             
        end
    
    end
end
clear Hist_test
Hist_test=Hist_train;
tic
%% Chi-square


% for j=1:size(Hist_test,2)               % Recorrido test
% H2=Hist_test(:,j);
% 
% d=zeros(1,size(Hist_train,2));
% 
% for i=1:size(Hist_train,2)              % Recorrido train
%     H1=Hist_train(:,i);
%     
%     d(i)=sum(((H1-H2).^2)./H1);         % Encuentra la distancia chi cuadrado a cada imagen de train
%     
% end
% 
% [val,match]=min(d);                     % Encuentra el de la menor distancia mejor machin
% 
% cat=ceil(match/30);                     % Encuentra la categoria 
% 
% cats_ch(j)=cat;                           % Arreglo de categorias
% end
% toc
% cats_ch=reshape(cats_ch,j/25,25).';           % Reordena filas categor?a a la cual pertenece. Columnas numero de imagen por cada categoria Matriz categoria a la que clasifico  

%% Intersection

% for j=1:size(Hist_test,2)               % Recorrido test
% H2=Hist_test(:,j);
% 
% d=zeros(1,size(Hist_train,2));
% 
% for i=1:size(Hist_train,2)              % Recorrido train
%     H1=Hist_train(:,i);
%     
%     d(i)=sum(min(H1,H2));               % Encuentra la interseccion de cada histograma de train
%     
% end
% 
% [val,match]=max(d);                     % Maxima intereseccion mayor matching
% 
% cat=ceil(match/30);                     % Encuentra la categoria          
% 
% cats_in(j)=cat;                         % Arreglo de categorias
% end
% toc
% cats_in=reshape(cats_in,j/25,25).';       % Reordena: filas categor?a a la cual deberia pertenece. Columnas numero de imagen por cada categoria Matriz categoria a la que clasifico  


%%
for i=1:750    
    classLabels(i,1)=ceil(i/30);        % Etiqueta para cada imagen de entrenamiento
end
% 
features=Hist_train';                   % Caracteristicas num_imagenes x textones(caracteristicas)
% B = TreeBagger(90,features,classLabels, 'Method','classification','minleaf',20,'OOBPred','On');  % Formaci?n bosque de desici?n estadistica
B = TreeBagger(100,features,classLabels, 'Method', 'classification','minleaf',12);  % Formaci?n bosque de desici?n

for j=1:size(Hist_test,2)              % Recorrido para cada imagen a evaluar
H2=Hist_test(:,j)';
predChar1 = B.predict(H2);              % Predicci?n categor?a
 
cat = str2double(predChar1);            
cats_tree(j)=cat;                       % Arreglo de categorias
end
toc

cats_tree=reshape(cats_tree,30,25).';   % Reordena: filas categor?a a la cual deberia pertenece. Columnas numero de imagen por cada categoria Matriz categoria a la que clasifico  


%% Matriz de confusion

cats=cats_tree;

for i=1:size(cats,1)                                                    % Recorre filas de Label_matching
    for j=1:size(cats,1)                                                % Recorre las categorias
        coinc{i,j}=find(cats(i,:)==j);                                  % Matriz que contiene cuales coincidieron con la categoria evaluada en el momento
        conf_tree_train(i,j)=length(coinc{i,j}).*100/size(cats,2);
    end 
end
% 
% save('conf_tree')



