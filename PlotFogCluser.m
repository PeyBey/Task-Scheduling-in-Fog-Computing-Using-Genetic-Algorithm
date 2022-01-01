function PlotFogCluser(F,S,BN,step)

for i=1:length(F)
    fog_x(i)=F(i).locX;
    fog_y(i)=F(i).locY;
    
end
for j=1:length(S)
    sen_x(j)=S{j}.locX;
    sen_y(j)=S{j}.locY;
    d{j}.x1=sen_x(j);
    d{j}.x2=F(BN(j)).locX;
    d{j}.y1=sen_y(j);
    d{j}.y2=F(BN(j)).locY;
end

figure(step)
plot(fog_x,fog_y,'^','linewidth',2)
xlim([0 100])
ylim([0 100])
hold on
plot(sen_x,sen_y,'o','linewidth',5)
for j=1:length(S)
    plot([d{j}.x1 d{j}.x2],[d{j}.y1 d{j}.y2],'-k','linewidth',1)
    hold on
    pause(.5)
end
legend('Fogs','Sensors')
hold on
