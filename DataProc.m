%% OMD�ظ���ʵ�����ݴ���
%  ## ���ݴ�����Ҫ����
%   * ͨ��ImageJ���Һλ�仯�Ĺ켣
%   * Excel�ļ���OMD��͸ͨ���ظ�������.xlsx�������Ĥͨ��
%   * MATLAB�ļ���DataProc.m����ȡ���ݽ������ݴ���ʱ��żȻ���
%% ��ԭʼ�����в�������ϵͳ����������ȡ����
%  ��Ҫ����DataExtract.m��ԭʼ����ExpData.mat
%% �ű�DataProc.m
%
clear;
%  �ӽṹ�����ݱ���ExpData�й������ݾ���
load('ExpDataSet.mat');
col1 = [ExpDataSet(2).ExpLog(1).ElapTime, ExpDataSet(2).ExpLog(1).Flux];
col2 = [ExpDataSet(2).ExpLog(2).ElapTime, ExpDataSet(2).ExpLog(2).Flux];
col3 = [ExpDataSet(2).ExpLog(3).ElapTime, ExpDataSet(2).ExpLog(3).Flux];
%  �����ݾ�������ȡ����
matout = [DataExtract(col1, 20), DataExtract(col2, 20), DataExtract(col3, 20)];
%  ������
tout = table(matout(:,1), matout(:,2), matout(:,3), ...
             matout(:,4), matout(:,5), matout(:,6), ...
             matout(:,7), matout(:,8), matout(:,9), ...
             'VariableNames', ...
             {'C1_ElapTime' 'C1_Flux' 'C1_StdDev' ...
              'C2_ElapTime' 'C2_Flux' 'C2_StdDev' ...
              'C3_ElapTime' 'C3_Flux' 'C3_StdDev' ...
             });
clear col1 col2 col3 matout;