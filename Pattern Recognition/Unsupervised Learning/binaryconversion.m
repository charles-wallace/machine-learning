function yknown = binaryconversion(y)
[r c] = size(y);
for i = 1:r    
    if(y(i) == 2)
        y(i) = 0;
    elseif(y(i) == 4)
        y(i) = 1;
    end
end
yknown = y;