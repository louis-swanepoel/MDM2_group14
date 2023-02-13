function [Centroid] = CentreOfMass(image)

originalImage = imread(image);

% Clean image of artifacts
cleanImage =  bwareaopen(originalImage, 20);
cleanImage = imfill(cleanImage, 'holes');


if cleanImage == 0
    Centroid = nan;
    return
else
    % label the sphere and collect the data for the sphere 
    [labeledImage, ~] = bwlabel(cleanImage, 8);
    props = regionprops(labeledImage, originalImage, 'all');
    Centroid = props(1).Centroid;
    return

end