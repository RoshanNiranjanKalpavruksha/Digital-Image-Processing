clc
clear all
close all
I = imread('rice.png');
J = imread('cameraman.tif');
for i=1:1:256
    for j=1:256
        output(i,j)=(I(i,j)+J(i,j));
    end
end
imshow(output);