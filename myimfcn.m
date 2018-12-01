function results = myimfcn(im)


% Image Processing Function
%
% IM      - Input image.
% RESULTS - A scalar structure with the processing results.




if(true)
    resizeImage = imresize(im,[28 28]);      % resizing image into 28x28 pixels
    imgray = rgb2gray(resizeImage);          % converting into grayscale image
else
    imgray = im;
end

inverseImage = uint8(255) - imgray;          % inversing the image colors

bw = imadjust(inverseImage);                 % adjusting the image pixels

results.bw     = bw;                         % resulting image


