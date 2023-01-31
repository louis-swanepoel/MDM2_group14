
% Extract all png files from the folder as photos
photos = dir('images/*.png');
counter = 0;

% Create centroid variable to collect position of the ball at a time
centroid = zeros(2,length(photos));

% Loop through photos finding the centre of mass of the ball at each frame 
for photo = photos'
    counter = counter+1;
    centroid(:,counter) = centreOfMass(photo);
   
end

% Extract relevant x and y positions 
xPositionAtRest = 500; 
yPositionAtRest = 700;
xDiscplacement = centroid(1,:)- xpositionAtRest;
yDiscplacement = centroid(2,:)- yPositionAtRest;
t = linspace(0,counter,counter);

% Plot the position of the particle with respect to time
