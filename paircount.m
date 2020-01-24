function [p1,p2,p3] = paircount(labels,y)
[n,d] = size(labels);
p1=0;
p2=0;
p3=0;
same=0;
samepred=0;
diff = 0;
diffpred = 0;

for i =1:n
    for j = i+1:n
        if labels(i,:) ==labels(j,:)
            same = same+1;
            if y(i,:)==y(j,:)
                samepred = samepred+1;
            end
        else
            diff = diff+1;
            if y(i,:)~=y(j,:)
                diffpred = diffpred+1;
            end
        end
    end
    
end
p1 = samepred/same;
p2 = diffpred/diff;
p3 = (p1+p2)/2.0;
end