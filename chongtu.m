function [ y ] =chongtu(single,list,app2k,inst )%����Ϊ����ins�����Ѵ��ڻ����е�ins��Լ��������ins��app�Ĺ������
app=zeros(size(list));%�б��е�inst����app�ļ���
for i=1:length(list)
    app(i)=inst(inst(:,1)==list(i),2);
end
sinapp=inst(inst(:,1)==single,2);%��ǰʵ�����ڵ�app
applist=unique(app);%���ظ���app���
if isempty(list)
    y=0;
end
for i=1:length(applist)
if (isempty(find(app2k(:,1)==applist(i)&app2k(:,2)==sinapp, 1)))%��ϲ�����app2k�ҵ�
    y=0;
    continue
else
    if applist(i)==sinapp
        num=length(find(applist==sinapp));
        if num>app2k(app2k(:,1)==sinapp&app2k(:,2)==sinapp,3)
            y=1;
            
        else
            y=0;
            
        end
    else
        num=length(find(applist==sinapp));
        if num>app2k(app2k(:,1)==applist(i)&app2k(:,2)==sinapp,3)
            y=1;
        else
            y=0;
        end
    end
    
%     if ismember(sinapp,applist)
%     num=length(find(applist==sinapp))+1;
%     if num>app2k(app2k(:,1)==applist(i)&app2k(:,2)==sinapp,3)
%         y=1;
%         break;  
%     elseif isempty(find(app2k(:,1)==sinapp&app2k(:,2)==sinapp, 1))||(num>app2k(app2k(:,1)==sinapp&app2k(:,2)==sinapp,3)+1)
%         y=1;
%         break       
%     else
%        y=0;
%     end
%     else
%     if (app2k(app2k(:,1)==applist(i)&app2k(:,2)==sinapp,3)>0)
%         y=0;
%     else
%         y=1;
%         break;
%  
%     end
%     
%     end
end
end
end




