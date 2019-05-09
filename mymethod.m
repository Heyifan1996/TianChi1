load 'data.mat';
inst_res=zeros(length(inst),202);
for i =1:length(inst)
    inst_res(i,1:2)=inst(i,1:2);
    tempapp=inst(i,2);
    inst_res(i,3:end)=app_res(tempapp,2:end);
end
% [inst_res,~]=sortrows(inst_res,199);
machsize1=mach(1,2:end);
machsize1(1)=machsize1(1)/2;
machsize2=mach(6000,2:end);
machsize2(1)=machsize2(1)/2;
result1=cell(6000,1);
result=cell(6000,1);
List=find(inst(:,3)~=0);
instid=inst(:,1);
machsize=zeros(6000,200);
machsize11=zeros(1,200);
machsize22=zeros(1,200);
machsize11(1:98)=32;
machsize11(99:196)=64;
machsize11(197:200)=[600,7,3,7];
machsize22(1:98)=92;
machsize22(99:196)=288;
machsize22(197:200)=[1024,7,7,9];
machsize(1:3000,:)=repmat(machsize11,3000,1);
machsize(3001:6000,:)=repmat(machsize22,3000,1);
copymach=machsize;
clear machsize11 machsize22;
[tempL,~]=find(inst_res(:,199)==600);


[L,~]=find(inst_res(:,3:100)>20);
L=unique(L);
[L1,~]=find(inst_res(:,101:198)>64);
L1=unique(L1);
% [L2,~]=find(inst_res(:,199)>600);

total_L=union(L,L1);
% total_L=union(total_L,L2);
% nowL=union(total_L,tempL);
% total_L=union(total_L,tempL);
havebeing=union(total_L,List);
instid(havebeing)=[];
%分配已分配的案列
for i=1:length(List)
    tempmach=inst(List(i),3);
    tempins=inst(List(i),1);
    result1{tempmach}=[result1{tempmach},tempins];
    machsize(tempmach,:)=machsize(tempmach,:)-inst_res(inst(:,1)==tempins,3:202);
    
end
% %分配tempL
% a=setdiff(tempL,List);%差集
% b=intersect(tempL,List);%交集
% a2=[a(1:length(a)/2),a(length(a)/2+1:end)];
% ains=inst(a,1);
% ains2=[ains(1:length(ains)/2),ains(length(ains)/2+1:end)];
% start=3001;
% while isempty(ains2)==0
%     if isempty(result1{start})
%         result1{start}=[result1{start},ains2(1,:)];
%         machsize(start,:)=machsize(start,:)-inst_res(a2(1,1),3:202)-inst_res(a2(1,2),3:202);
%         a(1,:)=[];
%         ains2(1,:)=[];
%         start=start+1;
%     else
%         start=start+1;
%         
%     end
%     
% end
% %分配total_L
% a1=setdiff(total_L,List);%差集
% a1ins=inst(a1,1);
% while isempty(a1ins)==0
%      if isempty(result1{start})
%         result1{start}=[result1{start},a1ins(1,:)];
%         machsize(start,:)=machsize(start,:)-inst_res(a1(1),3:202);
%         a1(1)=[];
%         a1ins(1)=[];
%         start=start+1;
%     else
%         start=start+1;
%         
%     end
% end
% 
%     
%     
% machsizemid=machsize;
% % while ~isempty(instid)
% k=500;
% 
% 
% maxiter=4;
% total_score=zeros(maxiter,1);
%     for i=1:maxiter
%         tic;
%         [result,instid,machsize]=assign(result,inst_res,instid,machsize,app2k,inst,size(result,1));
%         tic;
%         for ii=1:6000
%              total_score(i)=total_score(i)+score(6001-ii,result{6001-ii},inst_res); 
%         end
%         toc;
% %         index=rest(copymach,machsize,k);
%          index=find(machsize(:,197)>40);
%          for j=1:length(index)
%              temp=result{index(j)};
%             instid=[instid;temp'];          
%              machsize(index(j),:)=machsizemid(index(j),:);           
%              result{index(j)}=[];
%          end
%          toc;
%     end
% 
% 
%     for i=1:100
%         tic;
%         [result,instid,machsize]=assign(result,inst_res,instid,machsize,app2k,inst,size(result,1));
%         toc;
%     end
% 
% 
% %结果合并
% 
% for i=1:length(result)
%     result{i}=[result1{i},result{i}];
% end
% 
% total_score=0;
% tic;
% for i=1:6000
%    total_score=total_score+score(6001-i,result{6001-i},inst_res); 
% end
% toc;
% LLL=zeros(length(instid),202);
% for i=1:length(instid)
%     LLL(i,:)=inst_res(inst(:,1)==instid(i),:);
% end
% number=0;
% for k=16:length(result)
%     number=number+length(result1{k});
%     
% end