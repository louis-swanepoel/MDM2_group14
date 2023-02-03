
% Ball in question 
rodLength = 36/1000; % in M
rodMass = 128.2/1000; % in KG

% Extract all png files from the folder 'images' as photos 
frames = dir('imagesExp1-02.02/*.png');
frames = natsortfiles(frames);

% Define frame rate and time in motion etc
timeInMotion = 6;
nFrames = length(frames);
frameRate = nFrames/timeInMotion;
t = linspace(0,timeInMotion,nFrames);

% Create centroid variable to collect position of the ball at a time
centroid = zeros(2,nFrames);
counter = 0;

% Loop through photos finding the centre of mass of the ball at each frame 
for frame = frames'
    counter = counter+1;
    centroid(:,counter) = CentreOfMass([frame.folder '/' frame.name]);  
end

% Extract relevant x and y positions 
yPositionAtRest = (centroid(1,1)); 
zPositionAtRest = centroid(2,end)+(centroid(2,1)-centroid(2,end))./2;

% Pixel to m conversion
convertPixelToM = abs(rodLength/zPositionAtRest);
centroid = centroid.*convertPixelToM;
yPositionDatum = (centroid(1,1)); 
zPositionDatum = centroid(2,1)+(centroid(2,end)-centroid(2,1))/2;


% Extract relevant z and y displacement 
yDiscplacement = centroid(1,:) - yPositionDatum;
zDiscplacement = zPositionDatum-(centroid(2,:));
%R = zDiscplacement.^2 + yDiscplacement.^2;
theta = zeros(nFrames,1);

for n = 1:nFrames
    if zDiscplacement(n) > 0
        if yDiscplacement(n) > 0
            theta(n) = pi/2 - atan(abs(zDiscplacement(n)/yDiscplacement(n)));
        else
            theta(n) = NaN;%2*pi - atan(abs(zDiscplacement(n)/yDiscplacement(n)));
        end
    else
        if yDiscplacement(n) > 0
            theta(n) = pi/2 + atan(abs(zDiscplacement(n)/yDiscplacement(n)));
        else
            theta(n) = 3*pi/2 - atan(abs(zDiscplacement(n)/yDiscplacement(n)));
        end
    end
end

% Velocity calculations
yVelocity = zeros(1,nFrames);
zVelocity = zeros(1,nFrames);
thetaDot =  zeros(1,nFrames);

for n = 1:(nFrames-1)
    yVelocity(n) = (yDiscplacement(n+1)-yDiscplacement(n))./(timeInMotion/nFrames);
    zVelocity(n) = (zDiscplacement(n+1)-zDiscplacement(n))./(timeInMotion/nFrames);
    thetaDot(n) = (theta(n+1)- theta(n))./(timeInMotion/nFrames);
end

% Acceleration calculations 
yAcc = zeros(1,nFrames);
zAcc = zeros(1,nFrames);
thetaDotDot =  zeros(1,nFrames);

for n = 1:(nFrames-1)
    yAcc(n) = (yVelocity(n+1)-yVelocity(n))./(timeInMotion/nFrames);
    zAcc(n) = (zVelocity(n+1)-zVelocity(n))./(timeInMotion/nFrames);
    thetaDotDot(n) = (thetaDot(n+1)- thetaDot(n))./(timeInMotion/nFrames);
end

% Plot resulting displacements
figure(1)
tiledlayout(3,1)

nexttile
plot(t,yDiscplacement,'b--o')
ylabel('Displacement of the green ball in the y axis (m)',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,zDiscplacement,'r--o')
ylabel('Displacement of the green ball in the z axis (m)',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,theta,'k--o')
ylabel('Angle of rotation of green ball $\theta$',Interpreter='latex')
xlabel('Time (s)')
grid on

% Plot resulting Velocity
figure(2)
tiledlayout(3,1)

nexttile
plot(t,yVelocity,'b--o')
ylabel('Velocity of the green ball in the y axis $(ms^{-1})$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,zVelocity,'r--o')
ylabel('Velocity of the green ball in the z axis $(ms^{-1})$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,thetaDot,'k--o')
ylabel('Angular velocity of green ball $\dot{\theta}$',Interpreter='latex')
xlabel('Time (s)')
grid on

% Plot resulting Acceleration
figure(3)
tiledlayout(3,1)

nexttile
plot(t,yAcc,'b--o')
ylabel('Acceleration of the green ball in the y axis $(ms^{-2})$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,zAcc,'r--o')
ylabel('Acceleration of the green ball in the z axis $(ms^{-2})$',Interpreter='latex')
xlabel('Time (s)')
grid on

nexttile
plot(t,thetaDotDot,'k--o')
ylabel('Angular acceleration of green ball $\ddot{\theta}$',Interpreter='latex')
xlabel('Time (s)')
grid on