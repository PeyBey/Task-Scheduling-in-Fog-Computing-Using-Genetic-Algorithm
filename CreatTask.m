function S=CreatTask(S,TaskNum)
for i=1:length(S)
%     S{i}.TaskID=i;
    S{i}.Tasks=randi([1000 1500],1,TaskNum); %%MI 
    S{i}.Memory=randi([50 200],1,TaskNum); %% Required Memory (MB)
    S{i}.InputSize=randi([10 100],1,TaskNum); %% Input File Size (MB)
    S{i}.OutputSize=randi([10 100],1,TaskNum); %% Output File Size (MB)
    S{i}.BW=S{i}.InputSize+S{i}.OutputSize; %% Requiered bandwidth (MB)
end

