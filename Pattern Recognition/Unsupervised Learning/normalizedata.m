function bcw_norm = normalizedata(bcw)
[r c] = size(bcw);
bcw_norm = [];
norm_col = [];
for i = 1:(c-1)
    norm_col = normalizecolumn(bcw(1:r,i));
    bcw_norm = [bcw_norm , norm_col];
end
bcw_norm = [bcw_norm , bcw(1:r,c)];
