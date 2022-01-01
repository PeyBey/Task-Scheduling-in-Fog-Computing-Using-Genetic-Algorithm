function S=CreatSensor(num)
s_num=num;
S={};
for i=1:s_num
    S{i}.ID=i;
    S{i}.locX=randi([0 100],1);
    S{i}.locY=randi([10 50],1);
%     T.RequiredEneregy(i)=T.Size(i)*1e-5; %% mJ
end
