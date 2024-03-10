clc
clear all
close all
I = imread('coins.jpg');
I1 =imtophat(I, strel('disk',50));
level=graythresh(I1);
BW=im2bw(I1,level);
C=~BW;
D=-bwdist(C);
D(C)=-Inf;
L=watershed(D);
Wi=label2rgb(L,'hot','w');
im=I;
im(L==0)=0;
imshow(im);