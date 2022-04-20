clc
close all
clear all

im = imread('Thresholding5.jpg');

img = rgb2gray(im);
threshold = 110/256 + 0.01;
imbw = im2bw(img,threshold);
imbw = not(imbw);

one = bwmorph(imbw,'bothat',100);
two = bwmorph(imbw,'remove',5);
three = bwmorph(imbw,'skel',100);
four = bwmorph(imbw,'thicken',10);
five = bwmorph(imbw,'thin',20);
six = bwmorph(imbw,'tophat',1);



imshow(imbw)
subplot(3,3,1)
imshow(imbw)
title('orginal')
subplot(3,3,2)
imshow(one)
title('bothat')
subplot(3,3,3)
imshow(two)
title('remove_')
subplot(3,3,4)
imshow(three)
title('skel')
subplot(3,3,5)
imshow(four)
title('thicken')
subplot(3,3,6)
imshow(five)
title('thin')
subplot(3,3,8)
imshow(six)
title('tophat')


