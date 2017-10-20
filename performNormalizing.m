function [ out ] = performNormalizing( in )
%NORLIZE Summary of this function goes here
%   Detailed explanation goes here
[a, b] = size(in);
    maxIn=max(max(in));
    minIn=min(min(in));
    if minIn==-Inf
        m = 100;
        for i=1:a

            minIn = min(in);
            if minIn(i) < m && minIn(i) ~= -Inf
                m = minIn(i);
            end
        end
        minIn = m;
        
        for i=1:a
            for j=1:b
                if  in(i,j) == -Inf
                    in(i,j) = m;
                end
            end
        end
    end
    
    out = (in-minIn)./ (maxIn - minIn);
end

