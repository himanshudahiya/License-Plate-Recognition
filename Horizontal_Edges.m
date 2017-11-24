function [Hor,Max_H,inImg] = Horizontal_Edges(inImg,m,n)
%Horizontal_Edges : GETS THE LIMITS OF HORIZONTAL EDGES
%   Histogram is created with its y axis as difference of consecutive
%   pixels in a row and x axis as the row number. Difference is added to
%   sum for a certain difference inbetween two consecutive pixels.
%   Histogram is then smoothened to get proper limits. Finally threshold is
%   applied to get the start and finish location of the horizontal lines in
%   the image.

%% VARIABLES
sum = 0;
T_sum = 0;

diff = uint32(0);

Hor = zeros(n);
Max_H = 0;
maxi = 0;

%% CREATING HISTOGRAM FOR HORIZONTAL EDGE
for i = 2:1:n
    sum = 0;
    for j = 2:1:m
        if(inImg(j, i) > inImg(j-1, i))
            diff = uint32(inImg(j, i) - inImg(j-1, i));
        end
        if(inImg(j, i) <= inImg(j-1, i))
            diff = uint32(inImg(j-1, i) - inImg(j, i));
        end
        
        if(diff > 20)
            sum = sum + diff;
        end
    end
    Hor(i) = sum;

    if(sum > maxi)
        Max_H = i;
        maxi = sum;
    end
    T_sum = T_sum + sum;
end

avg = T_sum / n;

%% SMOOTHING HISTOGRAM
sum = 0;

for i = 21:1:(n-21)
    sum = 0;
    for j = (i-20):(i+20)
        sum = sum + Hor(j);
    end
    
    Hor(i) = sum / 41;
end
subplot(3,1,2);

%% FILTER VALUES BY DYNAMIC THRESHOLDING

for i = 1:1:n
    if(Hor(i) < avg)
        Hor(i) = 0;
        for j = 1:m
            inImg(j, i) = 0;
        end
    end
end

end

