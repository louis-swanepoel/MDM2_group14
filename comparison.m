thetaexp=theta;
thetamath=theta_results(:,1,:);
thetamath=linspace(thetamath(1),thetamath(end),numel(thetaexp));

for j=1:numel(thetaexp)
    for i=1:numel(thetaexp)
        obj(i)=abs(thetaexp(i)-thetamath(i,1,j))
    end
end

mu=linspace(0,1,numel(thetaexp));
plot(mu,obj);