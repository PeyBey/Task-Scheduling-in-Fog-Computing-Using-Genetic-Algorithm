function xnew1=ChromosomeEncoding(x1,rx,cx)

for r1=1:rx
    for c1=1:cx
        if x1(r1,c1)==1
            xnew1(1,c1)=r1;
        end
    end
end