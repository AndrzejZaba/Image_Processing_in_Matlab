clc
close all
clear all

imfinfo('hex.png');
im = imread('hex.png');
figure(3)
imshow(im)
title('obraz orginalny')
img = im2gray(im);
figure(1)
subplot(1,2,1)
imshow(img)
subplot(1,2,2)
imhist(img)

%imbw = im2bw(img);
imbw = img < 200;
figure(2)
imshow(imbw)
%% filtracja -- aktualnie nie potrzebna

%% segmentacja
[L, num] = bwlabel(imbw,4);
figure(4)
imshow(imbw)
hold on
%% cechy 
features = regionprops(L,'All')
%%
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






