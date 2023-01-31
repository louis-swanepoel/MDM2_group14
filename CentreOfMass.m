function [Centroid] = CentreOfMass(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

originalImage = imread('images/camera1_7.png');

% Clean image of artifacts
cleanImage = imfill(originalImage, 'holes');
cleanImage =  bwareaopen(cleanImage, 50);

% Display the clean binary image.
%figure(1)
%imshow(cleanImage);
%title('Image Cleared of Artifacts using area open function', 'FontSize', captionFontSize);

% label the sphere and collect the data for the sphere 
[labeledImage, ~] = bwlabel(cleanImage, 8);
props = regionprops(labeledImage, originalImage, 'all');

% Displays the equivelent diameter of the blob if it was a perfect circle 
%blobECD = [props.EquivDiameter];

%meanGL = props(1).MeanIntensity;		% Get average intensity.
%Area = props(1).Area;				% Get area.
%Perimeter = props(1).Perimeter;		% Get perimeter.
Centroid = props(1).Centroid;		% Get centroid 

end