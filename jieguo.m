function [ Y] = jieguo( result)
% Y=zeros(S,2);
count=1;
for i=1:length(result)
    
    if isempty(result{i})
        continue
    else
    LL=length(result{i});
    
    Y(count:(count+LL-1),1)=result{i}';
    Y(count:(count+LL-1),2)=repmat(i,LL,1);
    count=count+LL;
    end
    
end
end

