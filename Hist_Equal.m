function [inImg] = Hist_Equal(inImg,m,n)
%Hist_Equal : PERFORMS HISTOGRAM EQUALIZATION
%   Performs regular Histogram Equalisation to improve the contrast of the
%   image. First histogram is created. Pdf is found by dividing with total
%   pixels. Cdf is found by cumulative adding. Finally the histogram is
%   spread out to improve contrast.

nBins = 255;
HIST = zeros(nBins,1);
fac = ceil(255/nBins);

%% CREATING HISTOGRAM

for i = 1:1:m
    for j = 1:1:n
        pos = ceil(double(inImg(i,j))/fac);
        if(pos==0)
            pos = 1;
        end
        HIST(pos,1) = HIST(pos,1)+1;
    end
end

%% CREATING PDF
PDF=zeros(nBins,1);

for i=1:1:nBins
    PDF(i,1)=HIST(i,1)/(m*n);
end

%% CREATING CDF
CDF=zeros(nBins,1);

for i=1:1:nBins
    if(i~=1)
        CDF(i,1)=CDF(i-1,1)+PDF(i,1);
    else
        CDF(i,1)=PDF(i,1);
    end
end

%% CREATING NEW IMAGE WITH HISTOGRAM EQUALIZATION TECHNIQUE
for i=1:1:m
    for j=1:1:n
        pos=ceil(double(inImg(i,j))/fac);
        if(pos==0)
            pos=1;
        end
        bpos=round(CDF(pos,1)*(nBins-1))+1;
        if(bpos~=nBins)
            inImg(i,j)=round(((fac*(bpos-1))+(fac*bpos))/2);
        else
            inImg(i,j)=round(((fac*(bpos-1))+255)/2);
        end
    end
end

end

