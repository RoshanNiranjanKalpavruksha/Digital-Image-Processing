clc
clear all
close all
ima=imread('skel.jpg');
BW = im2bw(ima,0.5);
skel= bwmorph(BW,'skeleton',Inf);
B = bwmorph(skel, 'branchpoints');
E = bwmorph(skel, 'endpoints');
[y,x] = find(E);
B_loc = find(B);
Dmask = false(size(skel));
for k = 1:numel(x)
    D = bwdistgeodesic(skel,x(k),y(k));
    distanceToBranchPt = min(D(B_loc));
    Dmask(D < distanceToBranchPt) =true;
end
skelD = skel - Dmask;
imshow(skelD);
%hold all;
%[y,x] = find(B); plot(x,y,'ro')