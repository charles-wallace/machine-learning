function col = normalizecolumn(col)

[r,c] = size(col);

mu = mean(col);
for i = 1:r
    col(i,:) = col(i,:) - mu;
end;

svar = std(col);
for i = 1:r
    col(i,:) = col(i,:) ./ svar;
end;