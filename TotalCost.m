function [c]=TotalCost(task_i,F,m,p)

for k=1:length(F)
    c1(k)=p(k,m)*F(k).CUC*(task_i.Tasks/F(k).Pow);
    c2(k)=p(k,m)*F(k).MUC*(task_i.Memory);
    c3(k)=p(k,m)*F(k).BUC*(task_i.BW);
end
c=sum(c1)+sum(c2)+sum(c3);