
function x = Mutate(x, rx,cx)

 mutat1=randi([1,cx],1,2);
 mutat2=randi([1,rx],1,2);
x(mutat1)=mutat2;
end