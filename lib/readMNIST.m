% readMNIST 
%
% Description:
% Read digits and labels from raw MNIST data files
% (see http://yann.lecun.com/exdb/mnist for details)
% Pixel values will be normalised to float values 0..1
%
% Usage:
% [imgs, labels] = readMNIST(dataset, numImgs, offset)
%
% Arguments:
% dataset:    'train' or 'test'
% numImgs:    number of images to be read or 0 if all images shall be read
% offset:     skips the first offset number of digits before reading starts
%
% Returns:
% imgs:   numImgs x 784 sized matrix of digits if trimImages == 0 or
%         numImgs x 400 sized matrix of digits if trimImages == 1
% labels: numImgs x 1 matrix containing labels for each digit
%
% numImgs, offset, trimImages are optional
%                                                       Alfred Schöttl 2013

function [imgs, labels] = readMNIST( dataset, numImgs, offset, trimImages )
    
    path = mfilename( 'fullpath' );
    dir = fileparts( path );

    if strcmp( dataset, 'train' ) == 1
        fnImg = [ dir '/train-images.idx3-ubyte' ];
        fnLbl = [ dir '/train-labels.idx1-ubyte' ];
    elseif strcmp( dataset, 'test' ) == 1
        fnImg = [ dir '/t10k-images.idx3-ubyte' ];
        fnLbl = [ dir '/t10k-labels.idx1-ubyte' ];
    end
        
    if nargin<=1, numImgs = 0; end;
    if nargin<=2, offset = 0; end;
    if nargin<=3, trimImages = 0; end;

    fid = fopen(fnImg, 'r', 'b');
    magic_nr = fread(fid, 1, 'int32');
    if magic_nr ~= 2051
        error('Invalid database');
    end
    nImages = fread(fid, 1, 'int32');
    if numImgs == 0
        N = nImages - offset;
        if N <= 0
            error( [ 'offset is too big, there are only ' num2str(N) ' images' ] );
        end
    else
        N = numImgs;
    end
    if nImages < numImgs+offset
        error('Trying to read too many digits');
    end
    
    h = fread(fid, 1, 'int32');
    w = fread(fid, 1, 'int32');
    M = h*w;
    fseek(fid, offset*M, 'cof');   
    imgsraw = fread( fid, M*N, 'uint8' );
    fclose(fid);
    imgsraw = reshape( permute( reshape(imgsraw,[h,w,N]), [3,2,1] ), N,M );
    imgs = single(imgsraw)/255;

    fid = fopen(fnLbl, 'r', 'b');
    magic_nr = fread(fid, 1, 'int32');
    if magic_nr ~= 2049
        error('Invalid database');
    end
    fread(fid, 1, 'int32');
    fseek(fid, offset, 'cof');
    labels = fread(fid, N, 'uint8');
    fclose(fid);
    
end


