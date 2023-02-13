thetaexp=theta;
thetamath=theta_results(:,1);
thetamath=linspace(thetamath(1),thetamath(end),numel(thetaexp));

for i=1:size(thetaexp)
    diff(i)=abs(thetaexp(i)-thetamath(i))
end

mu=linspace(0,1,numel(thetaexp))
plot(mu,diff)