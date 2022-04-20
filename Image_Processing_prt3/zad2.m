clc
clear all
close all

y = imfinfo('pies.jpg');
im = imread('pies.jpg');
img = rgb2gray(im);

Id = im2double(img);

figure(1)
subplot(4,2,1), imhist(Id);
subplot(4,2,2), imshow(Id); title('orginal image');
%% Potega
Out1 = 1*(Id.^2);   % c = 2
Out2 = 1*(Id.^3);   % c = 3
Out3 = 1*(Id.^4);   % c = 4 wraz ze wzrostem c obraz jest bardziej przyciemniony  

subplot(4,2,3), imhist(Out1);
subplot(4,2,4), imshow(Out1); title('Power image 1');

subplot(4,2,5), imhist(Out2);
subplot(4,2,6), imshow(Out2); title('Power image 2');

subplot(4,2,7), imhist(Out3);
subplot(4,2,8), imshow(Out3); title('Power image 3');
%% Exponenta 

%ex1 = 0.3*exp(Id);
%ex2 = 0.2*exp(Id);
%ex3 = 0.1*exp(Id);

ex1 = 1*(((1+0.6).^(Id))-1);
ex2 = 2*(((1+0.6).^(Id))-1);
ex3 = 5*(((1+0.6).^(Id))-1);

figure(2)

subplot(4,2,1), imhist(Id);
subplot(4,2,2), imshow(Id); title('orginal image');

subplot(4,2,3), imhist(ex1);
subplot(4,2,4), imshow(ex1); title('Exp image 1');

subplot(4,2,5), imhist(ex2);
subplot(4,2,6), imshow(ex2); title('Exp2 image 2');

subplot(4,2,7), imhist(ex3);
subplot(4,2,8), imshow(ex3); title('Exp3 image 3');
%% Porównanie
figure(3)

subplot(3,2,1), imshow(Out1); title('Power image 1');
subplot(3,2,3), imshow(Out2); title('Power image 2');
subplot(3,2,5), imshow(Out3); title('Power image 3');

subplot(3,2,2), imshow(ex1); title('Exp image 1');
subplot(3,2,4), imshow(ex2); title('Exp image 2');
subplot(3,2,6), imshow(ex3); title('Exp image 3');


dt = 0.01;
x = 0:dt:1-dt;

ex11 = 1*(((1+0.6).^(x))-1);
ex22 = 2*(((1+0.6).^(x))-1);
ex33 = 5*(((1+0.6).^(x))-1);
figure(5)
subplot(1,3,1)
plot(x,ex11)
title('c=1')
subplot(1,3,2)
plot(x,ex22)
title('c=2')
subplot(1,3,3)
plot(x,ex33)
title('c=5')

figure(6)
plot(x,ex11)
hold on
plot(x,ex22,'r')
plot(x,ex33,'m')


eex1 = 2*(((1+0.3).^(x))-1);
eex2 = 2*(((1+0.4).^(x))-1);
eex3 = 2*(((1+0.6).^(x))-1);

figure(7)
subplot(1,3,1)
plot(x,eex1)
title('alfa = 0.3')
subplot(1,3,2)
plot(x,eex2)
title('alfa = 0.4')
subplot(1,3,3)
plot(x,eex3)
title('alfa = 0.6')

figure(8)
plot(x,eex1)
hold on
plot(x,eex2,'r')
plot(x,eex3,'m')

