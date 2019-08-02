function [disp] = GetDisplacement(XYLocs, opt)
%% Calculate the displacement
%   ## Procedure
%    * Get the original place (X0,Y0)
%    * Calculate the distance between (X,Y) and (X0,Y0)
%    * Output the data
%   ## I/O description
%     XYLocs - input matrix(I,2), X- and Y-coordinate data listed in row
%                                 I is the number of points
%     opt    - input integer: 1 default, set original as the first row
%     disp   - output matrix(I,1)
%
%  by Dr. GUAN, Guoqiang @ SCUT, 2019/7/30
%
%% 
% default argument of input opt
if nargin < 2
    opt = 1;
end
%
NumPoint = size(XYLocs, 1);
% initialize
d = zeros(NumPoint,1);
%
Original = XYLocs(opt,:);
Original = ones(NumPoint, 1)*Original;
Distance = XYLocs-Original;
disp = sqrt(dot(Distance', Distance'))';
%
end