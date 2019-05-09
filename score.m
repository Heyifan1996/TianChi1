function [ grade ] = score( x,y,inst_res)
if isempty(y)
    grade=0;
else
if x<=3000
    type=32;
else
    type=92;
end
use=zeros(1,98);
for i =1: length(y)
    id=y(i);
    use=use+inst_res(inst_res(:,1)==id,3:100);   
end
grade=0;
for i=1:98
   tempuse= use(i)/type;
   grade=grade+1+10*(exp(max(0,tempuse-0.5))-1);
   
end
end
grade=grade/98;

end

