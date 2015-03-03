clear all
close all
clc

%%

im1=imread('bird.bmp');
im2=imread('plane.bmp');

% Y = fft2(im1);

gauss_filt1=fspecial('gaussian',10,5);
gauss_filt2=fspecial('gaussian',40,10);
imfilter1=imfilter(im1,gauss_filt1);
imfilter2=imfilter(im2,gauss_filt2);


low=imfilter1;
high=(im2-imfilter2);

im3=low+high;

im4=vis_hybrid_image(im3);

imwrite(im3,'hibrida1.tiff')
imwrite(im4,'piramide_hibrida1.tiff')
figure(1)
subplot(1,2,1)
imshow(low)
subplot(1,2,2)
imshow(high)

figure(2)
imshow(im3)

figure(3)
imshow(im4)