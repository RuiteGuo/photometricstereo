function light_dirs_5x3 = computeLightDirections(center, radius, img_cell)
imgNum = size(img_cell,1);
DirectionMatrix = zeros(imgNum,3);
radiusSquare = radius^2;
for i = 1:imgNum
    maxPixelValue = max(img_cell{i}(:)); 
   [y,x] = find(img_cell{i}==maxPixelValue);
   
   DirectionMatrix(i,1) = (mean(x)-center(1));
   DirectionMatrix(i,2) = (mean(y)-center(2));
  DirectionMatrix(i,3) = sqrt(radiusSquare - DirectionMatrix(i,1)^2 - DirectionMatrix(i,2)^2);
  
   DirectionMatrix(i,:) = DirectionMatrix(i,:)*double(maxPixelValue)./radius; 
     
end
light_dirs_5x3 = DirectionMatrix;