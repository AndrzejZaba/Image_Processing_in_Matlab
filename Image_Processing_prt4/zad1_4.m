clc
close all
clear all
%% obraz
imfinfo('kszt.png')
im = imread('kszt.png');
im = imrotate(im,90);
figure(10)
subplot(1,2,1)
imshow(im)
title('Obraz orginalny')
img = im2gray(im);
subplot(1,2,2)
imshow(img)
title('Obraz w sklai szarości')
figure(1)
subplot(1,2,1)
imshow(img) 
subplot(1,2,2)
imhist(img)
%% binaryzacja
imbw = img < 218 + 0.01;
figure(2)
imshow(imbw)
%% segmentacja
[L, num] = bwlabel(imbw,4);
imshow(imbw)
hold on
%% cechy
feat = regionprops(L,'All')
%%
Areas = cat(1,feat.Area);
Perimeters = cat(1,feat.Perimeter);
MaxDiam = cat(1,feat.MajorAxisLength);
MinDiam = cat(1,feat.MinorAxisLength);
ConvexAreas = cat(1,feat.ConvexArea);

for k =1:num
feat(k).FormFactor= 4*pi*feat(k).Area/(feat(k).Perimeter^2);
feat(k).Roundness = 4*feat(k).Area/(pi*feat(k).MajorAxisLength.^2);
feat(k).AspectRatio = feat(k).MajorAxisLength / feat(k).MinorAxisLength;
feat(k).Solidity = feat(k).Area / feat(k).ConvexArea;
feat(k).Compactness = sqrt(4*feat(k).Area/pi)/feat(k).MajorAxisLength;
end
%%
figure(4)
imshow(imbw)
hold on
for i = 1:num
    rectangle('Position', feat(i).BoundingBox, 'EdgeColor', 'red');
    centroids = cat(1, feat.Centroid);
    plot(centroids(:,1), centroids(:,2), 'b*')
end

hold off
[x,y] = size(imbw);
X = 1:1:x;
Y = 1:1:y;
figure(5)
mesh(Y,X,L);
%% Sortowanie
%Macierz obiektów
L1 = L;
for i = 1:num
    if~(feat(i).Solidity >= 0.9 && feat(i).Eccentricity >= 0.8 && feat(i).Eccentricity<=1 && feat(i).Extent >= 0.5 && feat(i).Extent <= 0.7)    
            
    for j=1:x
        for k=1:y
            if(L1(j,k) == i)
                L1(j,k)=0;                
%objects = cat(2,objects,obj);
           
            end
        end
     
    end
    end
end
figure(7)
imshow(L1)








