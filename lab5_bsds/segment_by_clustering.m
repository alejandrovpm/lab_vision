function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)

global vec_cloust vec im1

im=imread(rgb_image);
% im=imresize(im,.25);

xx=size(im,2);
yy=size(im,1);

x_vec=1:xx;
y_vec=[1:yy]';

X=zeros(yy,xx);
Y=zeros(yy,xx);

for i=1:yy    
   X(i,:)=x_vec;    
end

for j=1:xx    
   Y(:,j)=y_vec;    
end


if strcmp('rgb',feature_space)
    im1=im;      
elseif strcmp('lab',feature_space)
    im1=rgb2lab(im);
elseif strcmp('hsv',feature_space)
    im1=rgb2hsv(im);
elseif strcmp('rgb+xy',feature_space)
    im1=im;
    im1(:,:,4)=X.*255/xx;
    im1(:,:,5)=Y.*255/yy;
elseif strcmp('lab+xy',feature_space)
    im1=rgb2lab(im);
    im1(:,:,4)=X.*20/xx;
    im1(:,:,5)=Y.*20/yy;
elseif strcmp('hsv+xy',feature_space)
    im1=rgb2hsv(im);
    im1(:,:,4)=X.*.5/xx;
    im1(:,:,5)=Y.*.5/yy;    
else
    
    disp('Introdusca un espacio de color valido')
    
end
% im1=im2double(im1);
vec=(arrange_imag(im1)); 
vec=im2double(vec);


if strcmp('k-means',clustering_method)
    vec_cloust=kmeans(vec,number_of_clusters,'Replicates',3);

elseif strcmp('gmm',clustering_method)
    
    model=fitgmdist(vec,number_of_clusters,'RegularizationValue',1e-6,'Options',statset('MaxIter',50));
    vec_cloust=cluster(model,vec);
    
elseif strcmp('hierarchical',clustering_method)
    
    %Threshold definition
    threshold = number_of_clusters;
    
    distance = pdist(vec, 'euclidean');
    tree = linkage(distance, 'single');
    vec_cloust = cluster(tree,'maxclust',threshold);

    
elseif strcmp('watershed',clustering_method)

    Ima_gris=rgb2gray(im);
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(Ima_gris), hy, 'replicate');
    Ix = imfilter(double(Ima_gris), hx, 'replicate');
    IxIy = sqrt(Ix.^2 + Iy.^2);
    
    
    %Extended regional minima
%   h_min = 40;
    markers = imextendedmin(IxIy,number_of_clusters);
    ngrad = imimposemin(IxIy,markers);
%     
    vec_cloust = watershed(ngrad);
%     Lrgb = label2rgb(pixel_labels, 'jet', 'w', 'shuffle')


end
my_segmentation=reshape(vec_cloust,[yy,xx]);
% image(my_segmentation)
% colormap(prism)
% % my_segmentation=vec;
end