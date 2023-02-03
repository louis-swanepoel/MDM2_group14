
% Extract all png files from the folder 'images' as photos 
frames = dir('imagesExp2-02.02/*.png');

% Define frame rate and time in motion etc
nFrames = length(frames);
timeInMotion = 5;
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
yPositionAtRest = centroid(1,1); 
zPositionAtRest = centroid(2,1);
yDiscplacement = centroid(1,:)- yPositionAtRest;
zDiscplacement = centroid(2,:)- zPositionAtRest;
theta = atan(zDiscplacement./yDiscplacement);

% Velocity calculations
yVelocity = zeros(1,nFrames);
zVelocity = zeros(1,nFrames);
thetaDot =  zeros(1,nFrames);
for n = 1:(nFrames-1)
    yVelocity(n) = (yDiscplacement(n+1)-yDiscplacement(n))./(timeInMotion/nFrames);
    zVelocity(n) = (zDiscplacement(n+1)-zDiscplacement(n))./(timeInMotion/nFrames);
    thetaDot(n) = (theta(n+1)- theta(n))./(timeInMotion/nFrames);
end

% Plot the position of the particle with respect to time
%tiledlayout(1,2);
%title(t,'{First attempt at measuring motion}',' {Green ball when released from \theta = 0}')


figure(1)
plot(t,yDiscplacement,'b--o')
ylabel('Displacement of the green ball in the y axis (pixels)')
xlabel('Time (s)')
grid on

figure(2)
plot(t,zDiscplacement,'r--*')
ylabel('Displacement of the green ball in the z axis (pixels)')
xlabel('Time (s)')
grid on

figure(3)
plot(t,theta,'k--o')
ylabel('Angle of rotation of green ball {/theta}')
xlabel('Time (s)')
grid on

figure(4)
tiledlayout(3,1)

nexttile
plot(t,yVelocity,'b--o')
ylabel('Velocity of the green ball in the y axis (pixels)')
xlabel('Time (s)')
grid on

nexttile
plot(t,zVelocity,'r--*')
ylabel('Velocity of the green ball in the z axis (pixels)')
xlabel('Time (s)')
grid on

nexttile
plot(t,thetaDot,'k--o')
ylabel('Angle of rotation of green ball {/dot{/theta}}')
xlabel('Time (s)')
grid on
