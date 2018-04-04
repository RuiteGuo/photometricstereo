function [center, radius] = findSphere(img)
binaryimg = imbinarize(img);
[y,x] = find(binaryimg==1);
area = size(y,1);
radius = sqrt(area/pi);
center = [mean(x),mean(y)];