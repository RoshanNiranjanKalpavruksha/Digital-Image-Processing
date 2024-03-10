clc
clear all
close all
warning off;
x=imread('Figure1.jpg');
y=imread('Figure2.jpg');
g=size(x);
y=imresize(y,[g(1),g(2)]);
figure;
imshow(x-y);
title('Difference of two images');
