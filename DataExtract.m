function [ DataOut ] = DataExtract( XYsDataSet, SubsetNum, opt )
%% Extract input dataset for given number of data
%   ## Procedure
%    * Evenly divide the input data into the given number of subset
%    * Get the mean for each subset of data
%    * Output the data
%   ## I/O description
%     XYDataSet - input matrix(I,J), x-ys data listed in row
%     SubsetNum - input integer
%     opt       - input integer: 0 default, 1 eliminate outliers
%     DataOut   - output matrix(NumSet,2*J-1)
%                     (J+1):(2*J-1) columns indicate the std. derivation of subset
%
%  by Dr. GUAN, Guoqiang @ SCUT, 2019/7/30
%
%% 
% default argument of input opt
if nargin < 3
    opt = 0;
end
% Get the size of input DataSet
[I,J] = size(XYsDataSet);
% Initialize
SubsetSize = floor(I/SubsetNum);
DataOut = zeros(SubsetNum, 2*J-1);
% Get the initial data index array
InitDataIdxs = 1:(SubsetSize*SubsetNum);
DataIdxs = reshape(InitDataIdxs, [SubsetSize, SubsetNum]);
% Calculate the mean for each subset of data
for i = 1:SubsetNum
    DataSubset = XYsDataSet(DataIdxs(:,i),:);
    YsDataSubset = DataSubset(:,2:end);
    if opt == 1
        % Get the boundary of outlier
        UpperBound = mean(YsDataSubset)+std(YsDataSubset);
        LowerBound = mean(YsDataSubset)-std(YsDataSubset);
        % Get the row indexes of outiers
        [RowIdxs, ~] = find(YsDataSubset>UpperBound | YsDataSubset<LowerBound);
        % Elimate the outliers
        DataSubset(RowIdxs,:) = [];
    end
    DataOut(i,1:J) = mean(DataSubset);
    DataOut(i,(J+1):(2*J-1)) = std(DataSubset(:,2:J));
end
%
end

