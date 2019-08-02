%% Prepare the workspace to process experimental data
%
%   by Dr. GUAN, Guoqiang @ SCUT, 2019-08-01
%
clear;
%   ��ʼ��
AllFileExisted = true;
%   ��������ļ�
AllFileExisted = AllFileExisted & exist('GetFileInfo.m', 'file');
AllFileExisted = AllFileExisted & exist('ExpDataSet.mat', 'file');
AllFileExisted = AllFileExisted & exist('XYLocs.mat', 'file');
if not(AllFileExisted) 
    return;
end
%   ����ͼƬ������Ϣ
GetFileInfo
%   ͨ���ļ������ƻ�ȡʵ����ţ����ʽΪEyymmdd-n
ExpSN = PathName((end-9):(end-1));
%   ��鵱ǰ�����ռ���ʵ�����ݼ�ExpDataSet�Ƿ����
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
    % ����Һλ�仯����
    ExpLog.Location = XYLocs(:,(i*2-1):(i*2));
    % ����Һ��λ��
    ExpLog.Distance = GetDisplacement(ExpLog.Location)/35.6016;
    % �����Ĥͨ��
    ExpLog.Flux = ExpLog.Distance*(pi/4*4)/(pi/4*100)./ExpLog.ElapTime;
    % �������
    ExpDataSet(NumExp+1).ExpLog(i) = ExpLog;
end
%   ���湤���ռ����ΪMAT�ļ�
save('ExpDataSet.mat', 'ExpDataSet');