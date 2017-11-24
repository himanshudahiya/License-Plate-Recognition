function [] = Reading_Plate(no,inImg)
%Reading_Plate : READING THE LINCENSE PLATE FROM THE IMAGE
%   Inbuilt ocr function is used to get the ocr of the license plate first.
%   Another oc rtechnique is used on the sam eplate to get another result.
%   Both the results are then dsiplayed and compared.

%% DISPLAYING RESPECTIVE CAR NO
fprintf('Car Number : %d\n',no);

%% LOADING THE OCR VALUES FROM DATABASE
load DataBase;

%% VARIABLES
Plate_Number = [];  % Plate number to be stored
Characters = [];    % Recognisable characters
Cha_1 = {};
Cha_2 = {};
Dlen = 540;

%% LICENSE NUMBER RECOGNITION FROM INBUILT MATLAB OCR FUNCTION
ocrResults = ocr(inImg);
% Displaying inbuilt function result
fprintf('Plate Number form inbuilt funciton : ');
disp(ocrResults.Text);
fprintf('  \n');

%% LICENSE NUMBER RECOGNITION FROM ANOTHER FUNCTION
inImg = Spliting(inImg);
len_Img = length(inImg);

k = 1;
for i = 1:1:len_Img
    Cha_1 = inImg{i}; 
    
    for j=1:1:Dlen
        Cha_2 = DataBase{j};
        X(j) = corr2(Cha_1,Cha_2);
    end
    
    [~,Pos] = max(X);
    Characters(k) = Pos;
    k = k+1;
end

Len = length(Characters);
% Matching characters
for i = 1:1:Len
    a = Characters(i);
    if ( (a>=1) && (a<=15) )
        Plate_Number = [Plate_Number,'0'];
    elseif ( (a>=16) && (a<=30) )
        Plate_Number = [Plate_Number,'1'];
    elseif ( (a>=31) && (a<=45) )
        Plate_Number = [Plate_Number,'2'];
    elseif ( (a>=46) && (a<=60) )
            Plate_Number = [Plate_Number,'3'];
    elseif ( (a>=61) && (a<=75) )
        Plate_Number = [Plate_Number,'4'];
    elseif ( (a>=76) && (a<=90) )
        Plate_Number = [Plate_Number,'5'];
    elseif ( (a>=91) && (a<=105) )
        Plate_Number = [Plate_Number,'6'];
    elseif ( (a>=106) && (a<=120) )
        Plate_Number = [Plate_Number,'7'];
    elseif ( (a>=121) && (a<=135) )
        Plate_Number = [Plate_Number,'8'];
    elseif ( (a>=136) && (a<=150) )
        Plate_Number = [Plate_Number,'9'];
    elseif ( (a>=151) && (a<=165) )
        Plate_Number = [Plate_Number,'A'];
    elseif ( (a>=166) && (a<=180) )
        Plate_Number = [Plate_Number,'B'];
    elseif ( (a>=181) && (a<=195) ) 
        Plate_Number = [Plate_Number,'C'];
    elseif ( (a>=196) && (a<=210) )
        Plate_Number = [Plate_Number,'D'];
    elseif ( (a>=211) && (a<=225) )
        Plate_Number = [Plate_Number,'E'];
    elseif ( (a>=226) && (a<=240) )
        Plate_Number = [Plate_Number,'F'];
    elseif ( (a>=241) && (a<=255) )
        Plate_Number = [Plate_Number,'G'] ;
    elseif ( (a>=256) && (a<=270) )
        Plate_Number = [Plate_Number,'H'];
    elseif ( (a>=271) && (a<=285) )
        Plate_Number = [Plate_Number,'I'] ;
    elseif ( (a>=286) && (a<=300) )
        Plate_Number = [Plate_Number,'J'] ;
    elseif ( (a>=301) && (a<=315) )
        Plate_Number = [Plate_Number,'K'] ;
    elseif ( (a>=316) && (a<=330) )
        Plate_Number = [Plate_Number,'L'] ;
    elseif ( (a>=331) && (a<=345) )
        Plate_Number = [Plate_Number,'M'];
    elseif ( (a>=346) && (a<=360) )
        Plate_Number = [Plate_Number,'N'];
    elseif ( (a>=361) && (a<=375) )
        Plate_Number = [Plate_Number,'O'] ;
    elseif ( (a>=376) && (a<=390) )
        Plate_Number = [Plate_Number,'P'] ;
    elseif ( (a>=391) && (a<=405) )
        Plate_Number = [Plate_Number,'Q'] ;
    elseif ( (a>=406) && (a<=420) )
        Plate_Number = [Plate_Number,'R'] ;
    elseif ( (a>=421) && (a<=435) )
        Plate_Number = [Plate_Number,'S'] ;
    elseif ( (a>=436) && (a<=450) )
        Plate_Number = [Plate_Number,'T'] ;
    elseif ( (a>=451) && (a<=465) )
        Plate_Number = [Plate_Number,'U'] ;
    elseif ( (a>=466) && (a<=480) )
        Plate_Number = [Plate_Number,'V'] ;
    elseif ( (a>=481) && (a<=495) )
        Plate_Number = [Plate_Number,'W'] ;
    elseif ( (a>=496) && (a<=510) )
        Plate_Number = [Plate_Number,'X']; 
    elseif ( (a>=511) && (a<=525) )
        Plate_Number = [Plate_Number,'Y'] ;
    elseif ( (a>=526) && (a<=540) )
        Plate_Number = [Plate_Number,'Z'];
    end

end

fprintf('Plate Number : ');
disp(Plate_Number);
disp('__________________________________');

end

