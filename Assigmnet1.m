img2=imread("colors.png");
img=rgb2ycbcr(img2);
imwrite(Y,"Y.png","png");
D=16
t=dctmtx(D);
img3=im2double(Y);
b=blkproc(img3,[D D],"P1*x*P2",t,t');
if(D==16)
mask=[ 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 
       1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
       1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
       1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0
       1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0
       1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
       1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
end
if(D==8)
mask=[1 1 1 1 0 0 0 0
      1 1 1 0 0 0 0 0
      1 1 0 0 0 0 0 0
      1 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0];

end
if(D==4)
mask=[1 1 0 0
      1 0 0 0
      0 0 0 0
      0 0 0 0];

end

   b2=blkproc(b,[D D] , "P1.*x",mask);
   orgimg=blkproc(b2,[D D] , "P1*x*P2",t',t);
       imshow(orgimg);
       imwrite(orgimg, "compressed.png","png");
