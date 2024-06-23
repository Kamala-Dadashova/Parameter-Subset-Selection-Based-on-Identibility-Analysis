function [Id, UnId] =PSS_SVD_onedec(Sens_mat,eta)
format shortEng
% p number of parameters.
[~,p]=size(Sens_mat);
[~,~,V]=svd(Sens_mat);
 sigma=svd(Sens_mat);
%Assume all of the parameters are identifiable.
Id=1:p; 
for k=p:-1:1
    if (sigma(k)/sigma(1))^2>eta
        break
    else
       [~,y]=max(abs(V(:,k))); %find the position ofict in singular vector that is the last column of V matrix
       Id(y)=[]; % Since y'th element is not identifiable we remove it from the identifiable element subset
       V(y,:)= [];
    end         
end
format default
UnId=1:p; %Define the subset for the unidentifiable parameters.
UnId(Id)=[]; % Remove all parameters that is identifiable from UnId set.
