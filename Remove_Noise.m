function [I_hequal] = Remove_Noise(inImg)
%Remove_Noise : REMOVAL OF NOISE BY BLURRING AND SHARPENING IMAGE
%   Image is first blurred to smoothen image and to reduce noise.
%   Sharpened image is then obtained. Histogram Equalization is
%   performed to improve the contrast of the image.
%   Horizontal flattening is done for easier horizontal edge detectio.
%   Vertical flattening is done for easier vertical edge detection.
%   Image is then send to 'Horizontal_Edges' and 'Vertical_Edges'
%   to get the limits of respective type of edges.
%   License plate is then extracted from the image.

[m,n] = size(inImg);    % Getting the size of the image : m = rows and n = columns

%% BLURRING/SMOOTHENING
filt = fspecial('Average');     % Getting the smoothing filter
I_blr = imfilter(inImg,filt);

%% SHARPENING IMAGE
Edge = inImg - I_blr;
inImg = I_blr + Edge;

%% PERFORMING HISTOGRAM EQUALIZATION
I_hequal = inImg;
I_hequal = Hist_Equal(I_hequal , m , n);

%% HORIZONTAL EDGES
[Hor,Max_H,I_hequal] = Horizontal_Edges(I_hequal , m , n);

%% VERTICAL EDGES
[Ver,Max_V,I_hequal] = Vertical_Edges(I_hequal , m , n);

%% EXTRACTING PLATE
I_hequal = Extract_Plate(I_hequal , m , n , Hor , Max_H , Ver , Max_V);

end

