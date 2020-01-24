function [pred, C,sumsquares,t] = kmeans(X, k)
[n,d] = size(X);
if k == 1
        C = X(1:k, :);
        prev = zeros(n,1);
else
    prev = zeros(n,1);
    rand = randperm(n);
    C = X(rand(1:k),:);
end

for t = 1:20
    sumsquares=0;
    for i = 1:size(X,1)
        min1 = Inf;
        for j = 1:k
            sqdist = sqrt((X(i,:)-C(j,:))*(X(i,:)-C(j,:))');
            if sqdist<min1
                min1 = sqdist;
                pred(i,1)=j;
            end
        end
    end
    sumsquares = sumsquaresval(X,C,k);
    %This is the convergence condition
    if pred ==prev
        break
    end
    prev = pred;
    C = zeros(k,d);
    for j=1:k
        C(j,:) = mean(X(pred==j,:));
    end  
    
end

function [sumsq] = sumsquaresval(X,C,k)
sumsq=0;
[n,d] = size(X);
for i = 1:n
        minimum =Inf;
        for j =1:k
            distance = X(i,:)-C(j,:);
            sq = distance *distance';
            if sq<minimum
                minimum = sq;
            end
        end
        sumsq = minimum+sumsq;
end


