function [Ver,Max_V,inImg] = Vertical_Edges(inImg,m,n)
%Vertical_Edges : GETS THE LIMITS OF VERTICAL EDGES
%   Histogram is created with its y axis as difference of consecutive
%   pixels in a column and x axis as the column number. Difference is added
%   to sum for a certain difference inbetween two consecutive pixels.
%   Histogram is then smoothened to get proper limits. Finally threshold is
%   applied to get the start and finish location of the vertical lines in
%   the image.

%% VARIABLES
sum = 0;
T_sum = 0;

diff = uint32(0);

Ver = zeros(m);
Max_V = 0;
maxi = 0;

%% CREATING HISTOGRAM FOR VERTICAL EDGE
for i = 2:1:m
    sum = 0;
    for j = 2:1:n
        if(inImg(i, j) > inImg(i, j-1))
            diff = uint32(inImg(i, j) - inImg(i, j-1));
        end
        if(inImg(i, j) <= inImg(i, j-1))
            diff = uint32(inImg(i, j-1) - inImg(i, j));
        end
        
        if(diff > 20)
            sum = sum + diff;
        end
    end
    Ver(i) = sum;
    
    if(sum > maxi)
        Max_V = i;
        maxi = sum;
    end
    T_sum = T_sum + sum;
end

avg = T_sum / m;

%% SMOOTHING HISTOGRAM
sum = 0;

for i = 21:(m-21)
    sum = 0;
    for j = (i-20):(i+20)
        sum = sum + Ver(j);
    end
    Ver(i) = sum / 41;
end

%% FILTER VALUES BY DYNAMIC THRESHOLDING
for i = 1:m
    if(Ver(i) < avg)
        Ver(i) = 0;
        for j = 1:n
            inImg(i, j) = 0;
        end
    end
end

end

