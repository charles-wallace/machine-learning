function h = plot_dec_region( nn, u, limits, dx )
% PLOT_DEC_REGIONS plots the decision regions for a neural network
% 
%   FIG_HANDLE = PLOT_DEC_REGION( network, means, [xmin xmax ymin ymax], dx )
%   where 'means' are the centers of the 4 Gaussian distributions, and dx 
%   is the stepsize in x and y for drawing the region.  It is assumed that
%   the first 2 distributions are class 1, and the second 2 are class 2. 
%
%   Example Usage:
%   >> h = plot_dec_region(nn,[0 1 0 1; 0 1 1 0],[-.5,1.5,-.5,1.5],0.01);
%
% See also meshgrid
%
% Copyright (C) 2016, by JRS @ Lehigh University

% Generate the input points
[xg,yg] = meshgrid(limits(1):dx:limits(2),limits(3):dx:limits(4));
xg = reshape(xg,1,numel(xg));
yg = reshape(yg,1,numel(yg));
% Get the output class assignment from the neural network
output = nn([xg;yg]);
output = round(output);
omega1=(output(1,:)==1);
omega2=(output(2,:)==1);
% Set up a nice figure
h = figure;
axis equal; 
hold on;
% Plot the data for class 1
plot(xg(omega1),yg(omega1),'r.');
% Plot the data for class 2
plot(xg(omega2),yg(omega2),'b.');
% Plot the Gaussian means for class 1
plot(u(1,1:2),u(2,1:2),'k+','markersize',10);
% Plot the Gaussian means for class 2
plot(u(1,3:4),u(2,3:4),'ko','markersize',10);
