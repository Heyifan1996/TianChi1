function [ machtype ] = turnto( tempins,machlist,app2k,inst,result ,machsize,inst_res)
machtype=0;
L=length(machlist);
while machtype==0
    tempmach=machlist(unidrnd(L));
    chazhi=machsize(tempmach,:)-inst_res(inst(:,1)==tempins,3:202);
    if chongtu(tempins,result{tempmach},app2k,inst)==0&&min(chazhi)>=0
        machtype=tempmach;
    else
%     	L=L-1;
        continue
    end


end

