clc
clear all
close all

lut = [];
x = [];     %input image
y = [];     %output image

x = [20 20 20 20 20 20 20 40;
    160 60 60 60 60 60 60 40;
    160 60 70 70 70 70 60 40;
    160 60 70 80 80 70 60 40;
    160 60 70 70 70 70 60 40;
    160 60 60 60 60 60 60 40;
    160 120 120 120 120 120 120 120];

[m,n] = size(x);

for i=1:60
    lut(i) = 0.5*i;
end

for i = 60:80
    lut(i) = 10*(i-57);
end

for i= 80:160
    lut(i) = 0.25*i + 210;
end

%Gary level modification using LUT
for i = 1:m
    for j = 1:n

        y(i,j)=lut(x(i,j));
    end
end

%display LUT
t = 1:60;
t1 = 60:80;
t2 = 80:160;

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





