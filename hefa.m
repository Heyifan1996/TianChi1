function [Y ] = hefa( list,app2k,inst )
if isempty(list)
    Y=1;
    
else
    
    for i=1:length(list)
        tempins=list(i);
        templist=setdiff(list,list(i));
        if chongtu(tempins,templist,app2k,inst)==1
            Y=0;
            break
        else
        	Y=1;
        end
    end
end
end

