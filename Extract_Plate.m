function [inImg] = Extract_Plate(inImg,m,n,Hor,Max_H,Ver,Max_V)
%Extract_Plate : EXTRACTING THE LICENSE PLATE FROM THE IMAGE
%   Histogram is drawn row wise and column wise for the various block in
%   the image. The block with the highest histogram value is considered as
%   the region containing the license plate.

%% HISTOGRAM HORIZONTAL WISE
j = 1;
for i = 2:1:n-2
    if( ( (Hor(i) ~= 0) && (Hor(i-1) == 0) ) || ( (Hor(i) ~= 0) && (Hor(i+1) == 0) ) )
        Col_Det(j) = i;
        j = j + 1;
    elseif( (Hor(i) ~= 0) && (Hor(i-1) == 0) && (Hor(i+1) == 0))
        Col_Det(j) = i;
        Col_Det(j+1) = i;
        j = j + 2;
    end
end

%% HISTOGRAM VERTICAL WISE
j = 1;
for i = 2:1:m-2
    if( ( (Ver(i) ~= 0) && (Ver(i-1) == 0) ) || ( (Ver(i) ~= 0) && (Ver(i+1) == 0)  ) )
        Row_Det(j) = i;
        j = j + 1;
    elseif( (Ver(i) ~= 0) && (Ver(i-1) == 0) && (Ver(i+1) == 0) )
        Row_Det(j) = i;
        Row_Det(j+1) = i;
        j = j + 2;
    end
end


%% GETTING THE TOTAL NO OF ROWS AND COLUMNS IN THE REMAINING AREA
[~,rSize] = size(Row_Det);
[~,cSize] = size(Col_Det);

if(mod(rSize, 2))
    Row_Det(rSize+1) = m;
end

if(mod(cSize, 2))
    Col_Det(cSize+1) = n;
end

%% CHECKING ALL POSSIBILITIES
for i = 1:2:rSize
    for j = 1:2:cSize
        if(~((Max_H >= Col_Det(j) && Max_H <= Col_Det(j+1)) && (Max_V >=Row_Det(i) && Max_V <= Row_Det(i+1))))
            start_row = Row_Det(i);
            end_row = Row_Det(i+1);
            
            start_col = Col_Det(j);
            end_col = Col_Det(j+1);
            
            for k = start_row:1:end_row
                for l = start_col:1:end_col
                    inImg(k,l) = 0;
                end
            end
        end
    end
end

end

