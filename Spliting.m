function [inImg] = Spliting(inImg)
%Spliting : EXTRACTING THE CAHRACTERS FROM THE IMAGE
%   Image is at first converted to a binary image. Than the image is taken
%   off part by part to get various features form it. The overallnumber of
%   features found is then returned back.

%% SIZE OF THE IMAGE
[m,n]=size(inImg);

%% CREATING BINARY IMAGE
% Thresholding at 125 i.e. half intensity
for i=1:m
    for j=1:n
        inten = inImg(i,j);
        if (inten >125)
            inImg(i,j) = 255;        
        else
            inImg(i,j) = 0;
        end
    end
end

bin_Img = im2bw(inImg);
inv_Bin = imcomplement(bin_Img);

%% LABELLING PARTS OF THE IMAGE AND GETTING THE INFORMATION OF REGIONS
[lab,no_por] = bwlabel(inv_Bin);
stats = regionprops(lab,'all');
[lab_1,~] = bwlabel(lab);
[~,no_por2] = bwlabel(lab_1);
stats = regionprops(lab_1,'Area');

Data=[];

for i = 1:1:no_por2
    Data1=stats(i).Area;
    Data=[Data,Data1];
end

Data2 = -sort(-Data);
Data3 = Data2(1:9);

AreaData = min(Data3);
removed = 0;

for i=1:1:no_por
    inten=stats(i).Area;
    if inten < AreaData
        lab(lab==i)=0;
        removed = removed + 1;
        no_por = no_por-1;
    end
end

[lab_2,no_por2] = bwlabel(lab);
  
stats1 = regionprops(lab_2,'Image');

C = [];
str='.bmp';
for j=1:1:(no_por2)
    inv_Bin = stats1(j);
    C{j} = [inv_Bin.Image];
    EE = imresize(C{j}, [45 24]);
    EE = imcomplement(EE);
     C{j} = EE;
    [r inv_Bin] = size(EE);
    inten = zeros(r,inv_Bin);
end

inImg=C;

end

