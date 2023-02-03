function [Centroid] = CentreOfMass(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

originalImage = imread(image);

% Clean image of artifacts
cleanImage = imfill(originalImage, 'holes');
cleanImage =  bwareaopen(cleanImage, 69);

if cleanImage == 0
    Centroid = NaN;
    return
else
    % label the sphere and collect the data for the sphere 
    [labeledImage, ~] = bwlabel(cleanImage, 8);
    props = regionprops(labeledImage, originalImage, 'all');
    Centroid = props(1).Centroid;

end