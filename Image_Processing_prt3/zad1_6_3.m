clc
clear all
close all

lut = [];
x = [];     %input image
y = [];     %output image

x = [20 20 20 20 20 20 20 80;
    160 60 60 60 60 60 60 40;
    160 60 70 70 70 70 60 40;
    160 60 70 80 80 70 60 80;
    160 60 70 70 70 70 60 40;
    160 60 60 60 60 60 60 40;
    120 100 80 60 40 20 10 80;
    160 120 120 120 120 120 120 120];

[m,n] = size(x);

for i = 1:80
    lut(i) = 255/80*i;
end

for i = 80:160
    lut(i) = 255/80*i - 255;
end

for i = 160:255
    lut(i) = 255/95*i - 429.473;
end

% Gary level modification using LUT
for i = 1:m
    for j = 1:n
        y(i,j) = lut(x(i,j));
    end
end

%Display LUT
t = 1:80;
t1 = 80:160;
t2 = 160:255;

plot(t,lut(t),t1,lut(t1),'b',t2,lut(t2)),title('Table - LUT')
xlabel('Grayscale range of Input image F')
ylabel('Grayscale range of output image G')

%Display input image, histogram and LUT
figure(2)
subplot(331), subimage(uint8(x),gray(256)),title('Input image')
subplot(332), imhist(uint8(x)),title('Histogram In')
subplot(335), plot(t,lut(t),t1,lut(t1),'b-',t2,lut(t2)), title("LUT")

%display output image, histogram
subplot(337), subimage(uint8(y),gray(256)),title('Output image')
subplot(338), imhist(uint8(y)), title('histogram Out')




