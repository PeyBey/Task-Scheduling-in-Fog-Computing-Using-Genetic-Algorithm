function [totalDist]=TotalDistance(S_i,F,m,p)

for k=1:length(F)
    dist_X(k)=p(k,m)*(S_i.locX-F(k).locX);
    dist_Y(k)=p(k,m)*(S_i.locY-F(k).locY);
end

totalDist=sum(.5*sqrt(dist_X.^2+dist_Y.^2));
