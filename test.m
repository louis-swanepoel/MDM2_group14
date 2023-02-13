

rodLengthGreen = 100/1000;
rodLengthBlack = 60/1000;
rodLengthYellow = 20/1000;
directory = 'YellowMainExp/Yellow2/*.png';

[theta,yDiscplacement,zDiscplacement,yVelocity,zVelocity,thetaDot] = FrameAnalysis(rodLengthYellow,directory);

timeInMotion = 6;
nFrames = length(theta);
frameRate = nFrames/timeInMotion;
t = linspace(0,timeInMotion,nFrames);

figure(1)
tiledlayout(3,1)

nexttile
plot(t,yDiscplacement,'b-o')
ylabel('Displacement of the Yellow ball in the y axis (m)',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

nexttile
plot(t,zDiscplacement,'r-o')
ylabel('Displacement of the Yellow ball in the z axis (m)',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

nexttile
plot(t,theta,'k-o')
ylabel('Angle of rotation of Yellow ball $\theta$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

% Plot resulting Velocity
figure(2)
tiledlayout(3,1)

nexttile
plot(t,yVelocity,'b-*')
ylabel('Velocity of the Yellow ball in the y axis $(ms^{-1})$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

nexttile
plot(t,zVelocity,'r-*')
ylabel('Velocity of the Yellow ball in the z axis $(ms^{-1})$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

nexttile
plot(t,thetaDot,'k-*')
ylabel('Angular velocity of Yellow ball $\dot{\theta}$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

% Plot resulting Acceleration
figure(3)
tiledlayout(3,1)

nexttile
plot(t,yAcc,'b--o')
ylabel('Acceleration of the Yellow ball in the y axis $(ms^{-2})$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

nexttile
plot(t,zAcc,'r--o')
ylabel('Acceleration of the Yellow ball in the z axis $(ms^{-2})$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on

nexttile
plot(t,thetaDotDot,'k--o')
ylabel('Angular acceleration of Yellow ball $\ddot{\theta}$',Interpreter='latex')
xlabel('Time (s)',Interpreter='latex')
grid on