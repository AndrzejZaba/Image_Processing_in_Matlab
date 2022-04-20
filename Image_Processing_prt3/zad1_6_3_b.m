clc
clear all
close all

op = imfinfo('pies.jpg');
[x, map] = imread('pies.jpg');

x = rgb2gray(x);

%x = im2double(img);
%comp     :0-80 -> 0-255
%strech     :80-160 -> 0-255
%strech     :160-255 -> 0-256

%to find max value of Image
% max(max(Image_in))

%to find image resolution:
[m, n] = size(x);

for i = 1:80
    lut(i) = 255/80*i;
end

for i = 80:160
    lut(i) = 255/80*i - 255;
end

for i = 160:255
    lut(i) = 255/95*i - 429.473;
end

% gray level modification using LUT
for i=1:m
    for j=1:n
        %gray values of input image are index for LUT table
        % Image_out(y) = LUT(Image_in)
        y(i,j) = lut(x(i,j)+1);
    end
end

t = 1:80;
t1 = 80:160;
t2 = 160:255;

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





