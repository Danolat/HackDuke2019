%HackDuke 2019 Project By Daniel Olatunji and Alan Nguyen
clc; clear;

% g = imread('PicOne.jpg');
% imshow(g)
% name = input('Enter image name: ', 's');

%%%%%%% Reads The Image %%%%%%%%
image = imread('PicOne.jpg');
image3 = imread('PicTwo.jpg');
[rows, columns, colors] = size(image);
image2 = image;
image4 = image3;

red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

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
% Ycent = round(Ycentroid);
% Xcent = round(Xcentroid);

%%%%%% Define New Centroid (BF) %%%%%%%
Ycent = 220;
Xcent = 400;

%Make the Second Image Blank
% for ii = 1: length(rows)
%     for jj = 1: length(columns)
%         %if (((ii-Ycent)^2)+ ((jj-Xcent)^2)) <= 25
%             image2(ii, jj, 1) = 0; %changes to red
%             image2(ii, jj, 2) = 0; %changes to green
%             image2(ii, jj, 3) = 0; %changes to blue
%         %end
%     end
% end

%%%%%First Red Block
for ii = Ycent-20: Ycent+15
    for jj = Xcent-115: Xcent+15
        %if (((ii-Ycent)^2)+ ((jj-Xcent)^2)) <= 25
            image(ii, jj, 1) = 255; %changes to red
            image(ii, jj, 2) = 0; %changes to green
            image(ii, jj, 3) = 0; %changes to blue
        %end
    end
end

%%%%%%Second Red Block
for ii = 230: 260
    for jj = 362: 370
        %if (((ii-Ycent)^2)+ ((jj-Xcent)^2)) <= 25
            image(ii, jj, 1) = 255; %changes to red
            image(ii, jj, 2) = 0; %changes to green
            image(ii, jj, 3) = 0; %changes to blue
        %end
    end
end


% figure (1)
% subplot(1,2,1),imshow(image2)
% subplot(1,2,2),imshow(image)

figure(1)
imshow(image2)
title('Pre-processed Image')

figure(2)
imshow(image)
title('Post-processed Image')

figure(3)
imshow(image3)
title('Pre-processed Image')

figure(4)
imshow(image4)
title('Post-processed Image')