function y=ChromosomeDecoding(x,rx,cx)
y=zeros(rx,cx);
while nnz(x)<cx
    [x_max,idmax]=max(x);
    [~,idmin]=min(x);
    x(idmin)=randi([1,rx]);

end
for c1=1:cx
    y(x(c1),c1)=1;
end
