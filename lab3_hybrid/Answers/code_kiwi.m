clear all
close all
clc

%%

im1=imread('kiwi_fruit.jpg');
im2=imread('kiwi_bird.jpg');

% Y = fft2(im1);

gauss_filt1=fspecial('gaussian',30,15);
gauss_filt2=fspecial('gaussian',100,150);
imfilter1=imfilter(im1,gauss_filt1);
imfilter2=imfilter(im2,gauss_filt2);


low=imfilter1;
high=(im2-imfilter2);

im3=low+high;

im4=vis_hybrid_image(im3);

imwrite(im3,'hybrid_kiwi.tiff')
imwrite(im4,'piramid_hybrid_kiwi.tiff')
figure(1)
subplot(1,2,1)
imshow(low)
subplot(1,2,2)
imshow(high)

figure(2)
imshow(im3)

figure(3)
imshow(im4)