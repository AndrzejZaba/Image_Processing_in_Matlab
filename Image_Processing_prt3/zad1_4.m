clc
clear all
close all

y = imfinfo('pies.jpg');
im = imread('pies.jpg');
img = rgb2gray(im);

Id = im2double(img);
[m,n] = size(Id);

%Rownanie s = c*(r^gamma)

c = 4; % im większe C tym obraz na koncu jasniejszy
g = [0.5 0.7 0.9 1 2 3 4 5 6]; %Gamma Array

    % dla g<1 - rozjasnienie dla g>1 - przyciemnienie

for r=1:length(g)
    for p=1:m
        for q=1:n
            Im2(p,q) = c*Id(p,q).^g(r);
        end
    end

figure(r)
subplot(1,2,1),imhist(mat2gray(Im2)); title('Image histogram'); xlabel('Gamma='),xlabel(g(r));
subplot(1,2,2),imshow(Im2); title('Power-law transformation'); xlabel('Gamma='),xlabel(g(r));

end

