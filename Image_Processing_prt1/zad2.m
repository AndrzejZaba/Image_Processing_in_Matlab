clc;
clear all
close all
A=[];
for k =1:1:300
    for i=1:1:300
        A(k,i) = rand();       
   end
end
B=[];
for k =1:1:300
    for i=1:1:300
        B(k,i) = (1+randn()/5)/2;       
   end
end
A = uint8(A)

figure(1)
subplot(2,2,1)
imshow(A);
title('rand()')
subplot(2,2,2)
imhist(A)

subplot(2,2,3)
imshow(B)
title('randn()')
subplot(2,2,4)
imhist(B)

