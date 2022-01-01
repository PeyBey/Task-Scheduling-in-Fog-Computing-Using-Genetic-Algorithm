function [cost_func,Total_Cost,Make_Span,Total_Distance]=NetworkModel(p,S,F,tasks)
[fog_cluster_num,sensor_num]=size(p);
alpha=.1;
beta=.2;
gama=.7;
min_cost=0;
for r=1:sensor_num
    EXT(:,r)=MakeSpan(S{r},F,r,p);
    totalDistance(r)=TotalDistance(S{r},F,r,p);
    min_dist(r)=MinDistance(S{r},F);
    min_makespan(r)=MinMakespan(S{r},F);
    total_cost(r)=TotalCost(S{r},F,r,p);
    min_cost(r)=MinCost(S{r},F,r);
end
TotalEXT=sum(EXT);
Make_Span=max(TotalEXT);
MinMakeSpan=min(min_makespan);
Total_Cost=sum(total_cost);
MinTotalCost=sum(min_cost);
Total_Distance=sum(totalDistance);
Min_Distance=min(min_dist);
FinalCost=alpha*(MinMakeSpan/Make_Span) + beta*(MinTotalCost/Total_Cost)+gama*(Min_Distance)/Total_Distance;
cost_func=FinalCost;
end

