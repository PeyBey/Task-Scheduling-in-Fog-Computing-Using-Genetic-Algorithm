function EXT=MakeSpan(task_i,F,m,p)

for k=1:length(F)
    EXT(k)=p(k,m)*(task_i.Tasks/F(k).Pow);
end
end
