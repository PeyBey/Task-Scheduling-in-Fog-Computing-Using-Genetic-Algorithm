function [F,idx,C]=CreatFogCluster(F,num)
for i=1:length(F)
    x(i)=F(i).locX;
    y(i)=F(i).locY;
end
t=[x' y'];
[idx,C] = kmeans(t,num);
for i=1:length(idx)
    F(i).ClusterID=idx(i);
    F(i).ClusterCenterLocX=C(idx(i),1);
    F(i).ClusterCenterLocY=C(idx(i),2);
end



