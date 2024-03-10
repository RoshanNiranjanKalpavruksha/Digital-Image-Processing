clc
clear all
close all
x = imread('vege.jpg');
F=dct(double(x));
G=dct(F);
ff=idct(G);
fff=idct(ff);
[r,c] = size(x);
DF=zeros(r,c);
DFF= DF;
IDF=DF;
IDFF=DF;
depth=4;
N=1;
for i=1:N:r
    for j=1:N:c
        f=x(i,j);
        df=dct2(f);
        DF(i:i+N-1,j:j+N-1)=df;
        dff=idct2(df);
        DFF(i:i+N-1,j:j+N-1)=dff;
        df(N:-1:depth+1,:)=0;
        df(:,N:-1:depth+1)=0;
        IDF(i:i+N-1,j:j+N-1)=df;
        dff=(idct2(df));
        IDFF(i:i+N-1,j:j+N-1)=dff;
    end
end
A=DFF/255;
imwrite(A,'abc1.tif');
B=IDFF/255;
imshow(B);
imwrite(B,'abc2.tif');