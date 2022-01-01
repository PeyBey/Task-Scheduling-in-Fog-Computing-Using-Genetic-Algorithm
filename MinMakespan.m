function min_makespan=MinMakespan(task_i,F)
for k=1:length(F)
    EXT(k)=task_i.Tasks/F(k).Pow;
end
[min_makespan,~]=min(EXT);