clear all
close all
clc

load('conf_ch_train.mat')
load('conf_ch_test.mat')
load('conf_in_train.mat')
load('conf_in_test.mat')
load('conf_tree_train4.mat')
load('conf_tree_test4.mat')

%%

sum_ch_train=0;
sum_ch_test=0;
sum_in_train=0;
sum_in_test=0;
sum_tree_train=0;
sum_tree_test=0;

for i=1:25
    
sum_ch_train=sum_ch_train+conf_ch_train(i,i);
sum_ch_test=sum_ch_test+conf_ch_test(i,i);
sum_in_train=sum_in_train+conf_in_train(i,i);
sum_in_test=sum_in_test+conf_in_test(i,i);
sum_tree_train=sum_tree_train+conf_tree_train(i,i);
sum_tree_test=sum_tree_test+conf_tree_test(i,i);

end




%%
figure(1)
F=gcf;
F.Color=[1 1 1];
F.Position=[0 50 900 550];
subplot(2,3,1)
image(conf_ch_train)
A=gca;
A.FontSize=14;
title('Entrenamiento chi-cuadrado')
axis square
% colormap(gray)

subplot(2,3,4)
image(conf_ch_test)
A=gca;
A.FontSize=14;
title('Evaluacion chi-cuadrado')
axis square
% colormap(gray)

subplot(2,3,2)
image(conf_in_train)
A=gca;
A.FontSize=14;
title('Entrenamiento interseccion')
axis square
% colormap(gray)

subplot(2,3,5)
image(conf_in_test)
A=gca;
A.FontSize=14;
title('Evaluacion interseccion')
axis square
% colormap(gray)

subplot(2,3,3)
image(conf_tree_train)
A=gca;
A.FontSize=14;
title('Entrenamiento treebagger')
axis square
% colormap(gray)

subplot(2,3,6)
image(conf_tree_test)
A=gca;
A.FontSize=14;
title('Evaluacion treebagger')
axis square
% colormap(gray)