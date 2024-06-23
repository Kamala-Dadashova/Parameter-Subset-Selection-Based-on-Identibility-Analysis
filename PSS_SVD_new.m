function [Id, UnId] = PSS_SVD_new(S,eta) 
[~,p]=size(S);
num_param = (1:p)'; 
[~,Sigma,V]=svd(S,'econ');
dg=diag(Sigma);
if (dg(p)/dg(1))^2> eta 
% if dg(p)> eta
    Id=num_param; 
    UnId = [];
else
    for m=1:p-1 
        if (dg(m)/dg(1))^2> eta && (dg(m+1)/dg(1))^2<=eta
%         if dg(m)> eta && (dg(m+1)<=eta)
            Vm = V(:, 1:m); 
            [~, ~, P]=qr(Vm');
            part=P'*num_param;
            Id=part(1:m)'; 
            UnId = part(m+1:end)'; 
            return 
         end
     end
end
end
