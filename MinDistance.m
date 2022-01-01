function [min_dist,id]=MinDistance(task_i,F)
for k=1:length(F)
    dist_X(k)=(task_i.locX-F(k).locX);
    dist_Y(k)=(task_i.locY-F(k).locY);
end
a=.5*sqrt(dist_X.^2+dist_Y.^2);
[min_dist,id]=min(a);