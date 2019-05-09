for i=1:10
tempresult=cell(length(index),1);
[tempresult,instid,machsize]=assign(tempresult,inst_res,instid,machsize,app2k,inst,size(tempresult,1));

for i =1:length(tempresult)
    result{index(i)}=tempresult{i};
end
index=find(machsize(:,197)>40);
for j=1:length(index)
            instid=[instid;result{index(j)}'];
             machsize(index(j),:)=machsizemid(index(j),:); 
             result{index(j)}=[];
end
end


number=0;
for i=1:length(result)
    number=number+length(result{i});
end


test=zeros(size(copymach));
for i=1:6000
    temp=result{i};
    for j=1:length(temp)
        test(i,:)=test(i,:)+inst_res(inst(:,1)==temp(j),3:202);
    end
end
temp222=copymach-test;
min(min(temp222))

% for i =1:length(ains2)
%     if chongtu(ains2(i,1),ains2(i,2),app2k,inst)==1||chongtu(ains2(i,2),ains2(i,1),app2k,inst)==1
%         y=0;
%         break
%     else
%         y=1;
%     end
% end
load('result_a2.mat');
Y=jieguo(result);
Listins=zeros(length(List),1);
for i =1:length(List)
    Listins(i)=inst(List(i),1);
end
% tempresult=cell(6000,1);
Ytran=zeros(length(List),2);
count=1;
while ~isempty(Listins)
    L=length(Listins);
    tempins=Listins(unidrnd(L));
    beforemach=inst(inst(:,1)==tempins,3);
    tempmach=Y(Y(:,1)==tempins,2);
    if (chongtu(tempins,result1{tempmach},app2k,inst )==0)&&min(inst_res(inst(:,1)==tempins,3:202)<=machsize(tempmach,:))&&(hefa(result1{tempmach},app2k,inst ))
         result1{beforemach}=setdiff(result1{beforemach},tempins);
         machsize(beforemach,:)=machsize(beforemach,:)+inst_res(inst(:,1)==tempins,3:202);
         result1{tempmach}=[result1{tempmach},tempins];
         machsize(tempmach,:)=machsize(tempmach,:)-inst_res(inst(:,1)==tempins,3:202);
        Listins(Listins==tempins)=[];
        Ytran(count,1)=tempins;
        Ytran(count,2)=tempmach;
        count=count+1;
    else
        continue
    end
    disp(count);
end

Listins=zeros(length(List),1);
for i =1:length(List)
    Listins(i)=inst(List(i),1);
end
temp=zeros(length(List),1);
for i=1:length(List)
    temp(i)=find(Y(:,1)==Listins(i));
end
index=setdiff([1:68219],temp);
Ytest=Y(index,:);
Y=[Ytran;Ytest];

