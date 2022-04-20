clc
close all
clear all
%% obraz
imfinfo('kszt.png')
im = imread('kszt.png');
figure(10)
imshow(im)
img = im2gray(im);
figure(1)
subplot(1,2,1)
imshow(img) 
subplot(1,2,2)
imhist(img)

%% dodanie szumu
imgNoise = imnoise(img, 'gaussian', 0,0.01);  % im większy pierwszy parametr tym jaśniejszy szum | drugi określa odchylenie standardowe  - pierwszy przesuwa wykres Gaussa na osi X a drugi go rozszerza lub zweza
figure(2)
subplot(1,2,1)
imshow(imgNoise)
subplot(1,2,2)
imhist(imgNoise)
I = medfilt2(imgNoise);
figure(3)
imshow(I)
%% Filtr
h2 = fspecial('gaussian',[3 3], 1000);
imFilt = imfilter(img,h2,'replicate');
figure(4)
subplot(1,2,1)
imshow(imFilt)
subplot(1,2,2)
imhist(imFilt)
figure(5)
bw1 = imFilt < 195+0.01;
subplot(1,2,1)
imshow(bw1)
title('bw1')
bw2 = imFilt > 195 - 0.01;
subplot(1,2,2)
imshow(bw2)
title('bw2')

IM = and(bw1,bw2);
figure(6)
imshow(IM)
%% segmentacja
[L, num] = bwlabel(IM,4);
imshow(IM)
hold on
%% cechy
features = regionprops(L,'All')

for i = 1:num
    rectangle('Position', features(i).BoundingBox, 'EdgeColor', 'red');
    centroids = cat(1, features.Centroid);
    plot(centroids(:,1), centroids(:,2), 'b*')
end

for k=1:length(features)
    x=features(k).Centroid(1,1);
    y=features(k).Centroid(1,2);
    plot(x,y,'*')
    a1 = tan((features(k).Orientation)*pi/180);
    b1 = y-a1*x;
    x1 = x-30;
    x2 = x+30;
    y1 = a1*x1+b1;
    y2 = a1*x2+b1;
    plot([x1 x2],[y1 y2], '-b')
end
hold off




