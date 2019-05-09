function [ index ] = rest(copymach,machsize,k )
radio=1-machsize./copymach;
radio=radio(:,1:98);
temp=zeros(length(radio),1);
for i=1:length(temp)
    temp(i)=max(radio(i,:));
end
[~,index_intial]=sort(temp);
index=index_intial(1:k);


end

