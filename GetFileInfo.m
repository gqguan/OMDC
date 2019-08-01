%% Get info of the specified files
%
% by Dr. GUAN, Guoqiang @ SCUT, 2019-7-31
%
%% Multi-select files with UI dialog
clear;
[filenames, PathName] = uigetfile('*.*', 'Select files ...', 'Multiselect', 'on');
filenum = length(filenames);
% initialize
filedatenum = zeros(filenum, 1);
for fileidx = 1:filenum
    filename = filenames(fileidx);
    filename = filename{:}; % convert cell into string
    FileInfo(fileidx) = dir([PathName, filename]);
    filedatenum(fileidx,1) = FileInfo(fileidx).datenum;
end
FileInfo = FileInfo'; % transpose the column array for easy output
FileDTs = datetime(filedatenum, 'ConvertFrom', 'datenum');
% Get elapsed time in seconds
ElapTimes = seconds(FileDTs-FileDTs(1));
clear -regexp ^file; % clear workspace