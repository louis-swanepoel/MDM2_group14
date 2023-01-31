clc
clear all
close all
warning off
c=webcam;
for i = 1:10;
    e=c.snapshot;
    mkdir = createMask(e);
    imshowpair(e,mkdir,'montage');
    imwrite(mkdir, ['camera1_' num2str(i) '.png'])
end

%takes 10 pics, saves them to the same folde the script is in
