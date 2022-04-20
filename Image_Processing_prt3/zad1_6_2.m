clc
clear all
close all

op = imfinfo('Lena.jpg');
[x, map] = imread('Lena.jpg');

x = rgb2gray(x);

%x = im2double(img);
%comp     :0-80 -> 0-20
%strech     :80-120 -> 20-200
%strech     :120-227 -> 200-256

%to find max value of Image
% max(max(Image_in))

%to find image resolution:
[m, n] = size(x);

for i=1:1:80
    lut(i) = (20/80)*i;                         %comp:  0-80 ->0:20
end

for i = 80:1:120
    lut(i) = (180/40)*(i-80) + 20;              % strech: 80-120 -> 20-200
end

for i = 120:1:255
    lut(i) = (56/47)*(i-120) + 200;             % strech: 120-227 -> 256
end

% gray level modification using LUT
for i=1:m
    for j=1:n
        %gray values of input image are index for LUT table
        % Image_out(y) = LUT(Image_in)
        y(i,j) = lut(x(i,j));
    end
end

t=1:80;
t1 = 80:120;
t2 = 120:255;

plot(t,lut(t),t1,lut(t1),'b-',t2,lut(t2)),title('Table - LUT')
xlabel('Gayscale range of Input image F')
ylabel('Gayscale range of Output image G')

figure(2)
% I
subplot(331),subimage(uint8(x),gray(256)),title('Input Image')
subplot(332),imhist(uint8(x),gray(256)),title('Histogram In')
subplot(335),plot(t,lut(t),t1,lut(t1),'b-',t2,lut(t2)),title('LUT')
%y

subplot(337),subimage(uint8(y),gray(256)),title('Output Image')
subplot(338),imhist(uint8(y),gray(256)),title('Histogram Out')





