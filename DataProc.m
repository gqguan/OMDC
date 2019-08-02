%% OMD重复性实验数据处理
%  ## 数据处理主要步骤
%   * 通过ImageJ获得液位变化的轨迹
%   * Excel文件“OMD渗透通量重复性试验.xlsx”计算跨膜通量
%   * MATLAB文件“DataProc.m”提取数据降低数据处理时的偶然误差
%% 从原始数据中采用类似系统抽样方法提取数据
%  需要函数DataExtract.m和原始数据ExpData.mat
%% 脚本DataProc.m
%
clear;
%  从结构化数据变量ExpData中构造数据矩阵
load('ExpDataSet.mat');
col1 = [ExpDataSet(2).ExpLog(1).ElapTime, ExpDataSet(2).ExpLog(1).Flux];
col2 = [ExpDataSet(2).ExpLog(2).ElapTime, ExpDataSet(2).ExpLog(2).Flux];
col3 = [ExpDataSet(2).ExpLog(3).ElapTime, ExpDataSet(2).ExpLog(3).Flux];
%  从数据矩阵中提取数据
matout = [DataExtract(col1, 20), DataExtract(col2, 20), DataExtract(col3, 20)];
%  输出结果
tout = table(matout(:,1), matout(:,2), matout(:,3), ...
             matout(:,4), matout(:,5), matout(:,6), ...
             matout(:,7), matout(:,8), matout(:,9), ...
             'VariableNames', ...
             {'C1_ElapTime' 'C1_Flux' 'C1_StdDev' ...
              'C2_ElapTime' 'C2_Flux' 'C2_StdDev' ...
              'C3_ElapTime' 'C3_Flux' 'C3_StdDev' ...
             });
clear col1 col2 col3 matout;