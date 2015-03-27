
addpath('lib')
clear all;close all;clc;

load('diccionario.mat')

% create filter bank
[fb] = fbCreate;
k=50;
D=dir('*.jpg');
% texton maps de dos nuevas imagenes

%%
for i=1:numel(D),
    im2=double(imread(D(i).name))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');
    
    
    Hist(:,i)=histc(tmap(:),1:k)/numel(tmap);
    
    % la distribucion de textones en la oveja deberia ser similar a la de la
    % imagen de referencia.
%     figure;subplot(1,2,1);imshow(tmap,[]);colormap(jet);
%     subplot(1,2,2);bar(histc(tmap(:),1:k)/numel(tmap));
%     drawnow;
end

