function mask = computeMask(img_cell)
mask = zeros(size(img_cell{1}));
for y=1:size(mask,1)
    for x=1:size(mask,2)
        for i=1:size(img_cell)
            if img_cell{i}(y,x) ~= 0
                mask(y,x) = 1;
            end
        end
    end
end