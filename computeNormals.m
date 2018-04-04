function [normals, albedo_img] = ...
    computeNormals(light_dirs, img_cell, mask)

[a,b] = size(mask);
albedo_img = zeros(a, b);
normals = zeros(a, b, 3);


[y,x]=find(mask==1);
max_Irradiance = zeros(size(img_cell));

for i=1:size(y)
 
    
    intensity = zeros(size(img_cell));
 
    for j=1:size(img_cell)
        intensity(j) = img_cell{j}(y(i),x(i));
        if i==1
            max_Irradiance(j) = max(max(img_cell{j}));
        end
    end
   
         Intensity= double([img_cell{1}(y(i),x(i)); img_cell{2}(y(i),x(i)); img_cell{3}(y(i),x(i));img_cell{4}(y(i),x(i));img_cell{5}(y(i),x(i))])./max_Irradiance(:);
        %apply least square 
        S = light_dirs(:,:);
        Stranspose = transpose(S);
        N = inv(Stranspose*S)*Stranspose*Intensity;
        
        % unit normal vetor and albedo calculation
        normals(y(i),x(i),:) =  N / norm(N);
        albedo_img(y(i),x(i)) =norm(N)*pi;

end

% scale to between 0 and 1
%max_alb = max(max(albedo_img));
%min_alb = min(min(albedo_img));
%albedo_img = (albedo_img - min_alb)/(max_alb - min_alb);