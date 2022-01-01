function [min_cost,id]=MinCost(task_i,F,m)
for k=1:length(F)
    c1(k)=F(k).CUC*(task_i.Tasks/F(k).Pow);
    c2(k)=F(k).MUC*(task_i.Memory);
    c3(k)=F(k).BUC*(task_i.BW);
end
[min_cost,id]=min([c1 c2 c3]);