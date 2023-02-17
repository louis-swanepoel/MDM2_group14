thetaexp=theta;
thetamath=theta_results(:,1,:);

for j=1:numel(thetaexp)
    for i=1:numel(thetaexp)
        obj(j,i)=abs(thetaexp(i)-theta_results(i,1,j));
    end
end
obj(isnan(obj))= 0;
for i=1:height(obj)
    newobj(i) = sum(obj(i,:));
end



mu=linspace(0,1,numel(thetaexp));
plot(mu,newobj);



