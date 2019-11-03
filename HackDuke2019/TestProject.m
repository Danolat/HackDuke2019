clc; clear;

%name = input('Enter image name: ', 's');
image = imread('IronShot_05.png');
[rows, columns, colors] = size(image);

red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

% binary = red<green & red<blue & green<blue & red>30 & red<75 & green>45 & green<85 & blue>130 & blue<200;
binary = red<green & red<blue & green<blue & red>30 & red<75 & green>45 & green<85 & blue>130 & blue<200;

[newRow, newCol] = find(binary==1);

for aa = 2: rows-1
    for bb = 2:columns-1
        if image(aa-1, bb-1)==0 || image(aa+1, bb+1)==0
         image(aa,bb)=0;
        end
    end
end

Ycentroid = mean(newRow);
Xcentroid = mean(newCol)-14;
Ycent = round(Ycentroid);
Xcent = round(Xcentroid);
fprintf('Eroded binary image saved to Binary.png \n');
fprintf('Centroid found at %g,%g and marked in GolfBall.png \n', Xcentroid, Ycentroid);

for ii = Ycent-15: Ycent+15
    for jj = Xcent-15: Xcent+15
        if (((ii-Ycent)^2)+ ((jj-Xcent)^2)) <= 25
            image(ii, jj, 1) = 255; %changes to red
            image(ii, jj, 2) = 0; %changes to green
            image(ii, jj, 3) = 0; %changes to blue
        end
    end
end

imshow(image);