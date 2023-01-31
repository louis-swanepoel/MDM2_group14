
% Extract all png files from the folder 'images' as photos 
frames = dir('images/*.png');

% Define frame rate and time in motion etc
nFrames = length(frames);
frameRate = 7;
timeInMotion = nFrames/frameRate;
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
xPositionAtRest = centroid(1,1); 
yPositionAtRest = centroid(2,1);
xDiscplacement = centroid(1,:)- xPositionAtRest;
yDiscplacement = centroid(2,:)- yPositionAtRest;

% Velocity calculations
xVelocity = zeros(1,nFrames);
yVelocity = zeros(1,nFrames);
for n = nFrames-1
    xVelocity(n) = xDiscplacement(n+1)-xDiscplacement(n);
    yVelocity(n) = xDiscplacement(n+1)-xDiscplacement(n);
end

% Plot the position of the particle with respect to time
plot(t,xVelocity,'b')

