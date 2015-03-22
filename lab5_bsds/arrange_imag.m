function y = arrange_imag(imagen)

yy=size(imagen,1);
xx=size(imagen,2);
iter=size(imagen,3);

for i=1:iter
    
    y(:,i)=reshape(imagen(:,:,i),xx*yy,1);   
    
end


end