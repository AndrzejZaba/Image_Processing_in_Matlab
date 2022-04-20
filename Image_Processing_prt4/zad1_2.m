clc
close all
clear all
%% obraz
imfinfo('hex.png')
im = imread('hex.png');
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
imshow(imgNoise)


%% Filtr
h2 = fspecial('gaussian',[9 9], 1000);
imF = imfilter(imgNoise,h2,'replicate');
figure(4)
subplot(1,2,1)
imshow(imF)
subplot(1,2,2)
imhist(imF)
%% Binaryzacja
%imbw = im2bw(I);
imba = imF < 215;
%% obraz
figure(5)
imshow(imba)
% open
se1 = strel('disk',5);
imOpen = imopen(imba,se1);


%% segmentacja
[L, num] = bwlabel(imOpen,4);
figure(7)
imshow(imOpen)
hold on
%% cechy 
features = regionprops(L,'All');
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

