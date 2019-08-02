%% Prepare the workspace to process experimental data
%
%   by Dr. GUAN, Guoqiang @ SCUT, 2019-08-01
%
clear;
%   初始化
AllFileExisted = true;
%   检查所需文件
AllFileExisted = AllFileExisted & exist('GetFileInfo.m', 'file');
AllFileExisted = AllFileExisted & exist('ExpDataSet.mat', 'file');
AllFileExisted = AllFileExisted & exist('XYLocs.mat', 'file');
if not(AllFileExisted) 
    return;
end
%   导入图片序列信息
GetFileInfo
%   通过文件夹名称获取实验序号，其格式为Eyymmdd-n
ExpSN = PathName((end-9):(end-1));
%   检查当前工作空间中实验数据集ExpDataSet是否存在
if not(exist('ExpDataSet', 'var'))
   load('ExpDataSet.mat');
end
%
if not(exist('XYLocs', 'var'))
   load('XYLocs.mat');
end
NumExp = length(ExpDataSet);
ExpDataSet(NumExp+1).ExpSN = ExpSN;
%
ExpLog = struct('FileInfo', [], 'ElapTime', [], 'Location', [], 'Distance', [], 'Flux', []);
ExpLog.FileInfo = FileInfo;
ExpLog.ElapTime = ElapTimes;
for i = 1:3
    % 导入液位变化坐标
    ExpLog.Location = XYLocs(:,(i*2-1):(i*2));
    % 计算液面位移
    ExpLog.Distance = GetDisplacement(ExpLog.Location)/35.6016;
    % 计算跨膜通量
    ExpLog.Flux = ExpLog.Distance*(pi/4*4)/(pi/4*100)./ExpLog.ElapTime;
    % 输出数据
    ExpDataSet(NumExp+1).ExpLog(i) = ExpLog;
end
%   保存工作空间变量为MAT文件
save('ExpDataSet.mat', 'ExpDataSet');