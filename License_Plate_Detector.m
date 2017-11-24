clc;
clear all;
% License_Plate_Detector : MAIN FILE FOR LICENSE PLATE DETECTOR
%   Reads the respective images. Converts the images from RGB to grayscale
%   for further processing. Images are then sent for Noise removal and
%   further processing in 'Remove_Noise'. Once the resultant image is
%   obtained, both the original and the final image is displayed. Then the
%   final image is sent for License plate reading in 'Reading_Plate'.

%% READING IMAGES
Img_1 = imread('1.jpg');
Img_2 = imread('2.jpg');
Img_3 = imread('3.jpg');
Img_4 = imread('4.jpg');
Img_5 = imread('5.jpg');
Img_6 = imread('6.jpg');
Img_7 = imread('7.jpg');

%% CONVERTING IMAGE TO GRAYSCALE
Img_Gray_1 = rgb2gray(Img_1);
Img_Gray_2 = rgb2gray(Img_2);
Img_Gray_3 = rgb2gray(Img_3); 
Img_Gray_4 = rgb2gray(Img_4);
Img_Gray_5 = rgb2gray(Img_5);
Img_Gray_6 = rgb2gray(Img_6);
Img_Gray_7 = rgb2gray(Img_7);

%% REMOVAL OF NOISE  | FOLLOWED WITH EXTRACTION OF PLATE
 Img_Gray_1 = Remove_Noise(Img_Gray_1);
 Img_Gray_2 = Remove_Noise(Img_Gray_2);
 Img_Gray_3 = Remove_Noise(Img_Gray_3);
 Img_Gray_4 = Remove_Noise(Img_Gray_4);
 Img_Gray_5 = Remove_Noise(Img_Gray_5);
 Img_Gray_6 = Remove_Noise(Img_Gray_6);
 Img_Gray_7 = Remove_Noise(Img_Gray_7);


%% DISPLAYING IMAGE
% Image 1
figure(1);
subplot(1,2,1);
imshow(Img_1);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_1);
title('PLATE');

% Image 2
figure(2);
subplot(1,2,1);
imshow(Img_2);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_2);
title('PLATE');

% Image 3
figure(3);
subplot(1,2,1);
imshow(Img_3);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_3);
title('PLATE');
% Image 4
figure(4);
subplot(1,2,1);
imshow(Img_4);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_4);
title('PLATE');

% Image 5
figure(5);
subplot(1,2,1);
imshow(Img_5);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_5);
title('PLATE');

% Image 6
figure(6);
subplot(1,2,1);
imshow(Img_6);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_6);
title('PLATE');

% Image 7
figure(7);
subplot(1,2,1);
imshow(Img_7);
title('ORIGINAL');
subplot(1,2,2);
imshow(Img_Gray_7);
title('PLATE');

%% DISPLAYING LICENSE READING
Reading_Plate(1,Img_Gray_1);
Reading_Plate(2,Img_Gray_2);
Reading_Plate(3,Img_Gray_3);
Reading_Plate(4,Img_Gray_4);
Reading_Plate(5,Img_Gray_5);
Reading_Plate(6,Img_Gray_6);
Reading_Plate(7,Img_Gray_7);