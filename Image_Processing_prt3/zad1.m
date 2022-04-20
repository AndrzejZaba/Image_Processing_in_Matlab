y = imfinfo('pies.jpg')
im = imread('pies.jpg');
img = rgb2gray(im);

%imshow(img)

Id = im2double(img);

figure(1)
subplot(4,2,1), imhist(Id);
subplot(4,2,2), imshow(Id); title('orginal image');
%% Log
Out1 = (2*log(1+Id));   % c = 2
Out2 = (3*log(1+Id));   % c = 3
Out3 = (5*log(1+Id));   % c = 5 wraz ze wzrostem c obraz jest bardziej rozświetlony 

subplot(4,2,3), imhist(Out1);
subplot(4,2,4), imshow(Out1); title('Log image 1');

subplot(4,2,5), imhist(Out2);
subplot(4,2,6), imshow(Out2); title('Log image 2');

subplot(4,2,7), imhist(Out3);
subplot(4,2,8), imshow(Out3); title('Log image 3');
%% SQRT 

Pierw1 = 2*sqrt(Id);
Pierw2 = 3*sqrt(Id);
Pierw3 = 5*sqrt(Id);

figure(2)

subplot(4,2,1), imhist(Id);
subplot(4,2,2), imshow(Id); title('orginal image');

subplot(4,2,3), imhist(Pierw1);
subplot(4,2,4), imshow(Pierw1); title('sqrt image 1');

subplot(4,2,5), imhist(Pierw2);
subplot(4,2,6), imshow(Pierw2); title('sqrt image 2');

subplot(4,2,7), imhist(Pierw3);
subplot(4,2,8), imshow(Pierw3); title('sqrt image 3');
%% Porównanie
figure(3)

subplot(3,2,1), imshow(Out1); title('Log image 1');
subplot(3,2,3), imshow(Out2); title('Log image 2');
subplot(3,2,5), imshow(Out3); title('Log image 3');

subplot(3,2,2), imshow(Pierw1); title('sqrt image 1');
subplot(3,2,4), imshow(Pierw2); title('sqrt image 2');
subplot(3,2,6), imshow(Pierw3); title('sqrt image 3');
