function F=CreatFog(num)
for i=1:num
    F(i).ID=i;
    F(i).Pow=randi([1300 1500],1); %%MIPS
    F(i).locX=randi([10 90],1);  %% Location X
    F(i).locY=randi([60 99],1);  %% Location Y
    F(i).State='idl'; %% State of Fog
    F(i).CUC=.1 + (.3)*rand(1,1); %% CPU Usage Cost (G$/MB)
    F(i).MUC=.01 + (.04)*rand(1,1); %% CPU Usage Cost (G$/MB)
    F(i).BUC=.01 + (.03)*rand(1,1); %% CPU Usage Cost (G$/MB)
end