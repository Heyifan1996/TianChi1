function [result,instid,machsize] =assign( result,inst_res,instid,machsize,app2k,inst,intial_type)%把符合条件的ins存入机器
count=1;
type=intial_type;
temp=0;
while length(instid)>=1&&(type>=1)
        id=unidrnd(length(instid));
        if machsize(type,:)>=inst_res(inst_res(:,1)==instid(id),3:202)
            y=chongtu(instid(id),result{type},app2k,inst);
            if y==0
            machsize(type,:)=machsize(type,:)-inst_res(inst_res(:,1)==instid(id),3:202);
            result{type}=[result{type},instid(id)];
            instid(id)=[];
            count=count+1;
            else
                continue
            end
        else
            temp=temp+1;
            
            type=intial_type-floor(temp/10);
        end      
      
end



end

