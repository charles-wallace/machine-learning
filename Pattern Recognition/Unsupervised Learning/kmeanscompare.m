function idx = kmeanscompare(bcw, yknown)
rng(1);
idx = kmeans(bcw,2);
[r c] = size(yknown);
% altering class values to be passed to the plot confusion
% function
for i = 1:r
    if(yknown(i) == 2)
        %benign
        yknown(i) = 0;
    elseif(yknown(i) == 4)
        %malignant
        yknown(i) = 1;
    end
end

% making idx values consistent with the known vectors
% in the yknown vector 
for i = 1:r    
    if(idx(i) == 1)
        idx(i) = 0;
    elseif(idx(i) == 2)
        idx(i) = 1;
    end
end
plotconfusion(yknown', idx');