clear all, close all, clc

%Read test image
A=imread('C:\Users\mikke\OneDrive\Documents\projekt_4\memdump_16x16.png');

%Convert to YCbCr and levelshift
B = rgb2ycbcr(A);
Y = int16(B(:,:,1))-128
CB = int16(B(:,:,2))-128
CR = int16(B(:,:,3))-128

%Divide data into 8x8 blocks
Yblocks = mat2cell(Y, [8 8], [8 8]);
CBblocks = mat2cell(CB, [8 8], [8 8]);
CRblocks = mat2cell(CR, [8 8], [8 8]);

%dct2 for all blocks. Rounded for comparrison to C script
Ytblock1 = fix(dct2(Yblocks{1,1}))
Ytblock2 = fix(dct2(Yblocks{1,2}))
Ytblock3 = fix(dct2(Yblocks{2,1}))
Ytblock4 = fix(dct2(Yblocks{2,2}))

CBtblock1 = fix(dct2(CBblocks{1,1}))
CBtblock2 = fix(dct2(CBblocks{1,2}))
CBtblock3 = fix(dct2(CBblocks{2,1}))
CBtblock4 = fix(dct2(CBblocks{2,2}))

CRtblock1 = fix(dct2(CRblocks{1,1}))
CRtblock2 = fix(dct2(CRblocks{1,2}))
CRtblock3 = fix(dct2(CRblocks{2,1}))
CRtblock4 = fix(dct2(CRblocks{2,2}))

%Quant tables
Qy = [16, 11, 10, 16, 24, 40, 51, 61;
     12, 12, 14, 19, 26, 58, 60, 55;
     14, 13, 16, 24, 40, 57, 69, 56;
     14, 17, 22, 29, 51, 87, 80, 62;
     18, 22, 37, 56, 68, 109, 103, 77;
     24, 35, 55, 64, 81, 104, 113, 92;
     49, 64, 78, 87, 103, 121, 120, 101;
     72, 92, 95, 98, 112, 100, 103, 99];
     
 Qc = [17, 18, 24, 47, 99, 99, 99, 99;
      18, 21, 26, 66, 99, 99, 99, 99;
      24, 26, 56, 99, 99, 99, 99, 99;
      47, 66, 99, 99, 99, 99, 99, 99;
      99, 99, 99, 99, 99, 99, 99, 99;
      99, 99, 99, 99, 99, 99, 99, 99;
      99, 99, 99, 99, 99, 99, 99, 99;
      99, 99, 99, 99, 99, 99, 99, 99];
    
   
%Quant for all blocks
QYtblock1 = fix(Ytblock1./Qy)
QYtblock2 = fix(Ytblock2./Qy)
QYtblovk3 = fix(Ytblock3./Qy)
QYtblock4 = fix(Ytblock4./Qy)

QCBtblock1 = fix(CBtblock1./Qc)
QCBtblock2 = fix(CBtblock2./Qc)
QCBtblock3 = fix(CBtblock3./Qc)
QCBtblock4 = fix(CBtblock4./Qc)

QCRtblock1 = fix(CRtblock1./Qc)
QCRtblock2 = fix(CRtblock2./Qc)
QCRtblock3 = fix(CRtblock3./Qc)
QCRtblock4 = fix(CRtblock4./Qc)
