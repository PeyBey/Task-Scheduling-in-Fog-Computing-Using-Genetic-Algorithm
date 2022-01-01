function [y1,y2]=MyCrossOver(x1,x2)
[rx,cx]=size(x1);
xnew1=ChromosomeEncoding(x1,rx,cx);
xnew2=ChromosomeEncoding(x2,rx,cx);
len=length(xnew1);
n1=floor(len/2);
n2=len-n1;
t1=randi([1,n1],1);
t2=randi([n2,len],1);
encoded_y1=[xnew2(1:t1) xnew1(t1+1:t2) xnew2(t2+1:len)];
encoded_y2=[xnew1(1:t1) xnew2(t1+1:t2) xnew1(t2+1:len)];
y1=ChromosomeDecoding(encoded_y1,rx,cx);
y2=ChromosomeDecoding(encoded_y2,rx,cx);
end