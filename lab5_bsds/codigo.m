clear all
close all 
clc

% global vec_cloust vec

%%
images=dir('*.jpg');


for j=2:length(images)
name=images(j).name;
[a,name2,c]=fileparts(name);

%%
for i=1:5
%A=segment_by_clustering(name,'lab+xy','k-means',i*3);    
A=segment_by_clustering(name,'lab+xy','gmm',i*3);
segs{i}=A;
end


save([name2,'.mat'],'segs')
end