% Y=zeros(6000,1);
% for i =1:length(result1)
%     Y(i)=hefa(result1{i},app2k,inst );
% end
% find(Y==0);

Y=zeros(2*length(inst),2);
count=1;
ss=0;
tempmach=6000;
% result2=result1;
while tempmach>=1
    tempmach=6000-ss;
    if ~isempty(result1{tempmach})
        temp=result1{tempmach};
        for j=1:length(temp)
            Y(count,1)=temp(j);
            Y(count,2)= turnto( temp(j),[1:tempmach-1],app2k,inst,result1,machsize,inst_res );
            result1{Y(count,2)}=[result1{Y(count,2)},temp(j)];
            machsize(Y(count,2),:)=machsize(Y(count,2),:)-inst_res(inst(:,1)==temp(j),3:202);
            result1{tempmach}=setdiff(result1{tempmach},temp(j));
            count=count+1;
            
        end
    else
        if ~isempty(result{tempmach})
        
        temp1=result{tempmach};
        for j=1:length(temp1)
            Y(count,1)=temp1(j);
            Y(count,2)=tempmach;
            result1{tempmach}=[result1{tempmach},Y(count,1)];
            if inst(inst(:,1)==temp1(j),3)~=0
                 result1{inst(inst(:,1)==temp1(j),3)}=setdiff(result1{inst(inst(:,1)==temp1(j),3)},temp1(j));
                 machsize(inst(inst(:,1)==temp1(j),3),:)=machsize(inst(inst(:,1)==temp1(j),3),:)+inst_res(inst(:,1)==temp1(j),3:202);
            end
            count=count+1;
            
        end
        ss=ss+1;
        else
             ss=ss+1;
        end
    end
    disp(tempmach);
end

