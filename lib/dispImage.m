function dispImage( img, label, m, n )
% displays an MNIST (or similar) image
% img:   vector or matrix of pixels
% label: number or string to be displayed, use [] if nothing to display
% m, n:  dimensions of image, can be omitted for matrices and for vectors of
%        square images (as with MNIST)
% label, m, n are optional
%
% examples:
% dispImage( img );
% dispImage( img, 7 );
% dispImage( img, 'My label displayed in the image' );
%                                                      Alfred Schöttl 2013
    if nargin <= 2 || nargin >= 3 && m==0 && n==0
        if size(img,1)>1 && size(img,2)>1
            m = size(img,1);
            n = size(img,2);
            img = reshape( img, 1, m*n );
        else
            m = floor( sqrt(length(img)) );
            n = m;
            img = reshape( img, 1, m*n );
        end
    end
    if nargin == 1
        label = [];
    end
    img = 1-max(min(img,1),0);
    colormap( 'gray' );
    image( reshape( img*64, m, n ) );
    axis equal
    set(gca,'Visible','off')
    if ~isempty(label)
        if ~ischar(label)
            label = num2str(label);
        end
        text( n-0.5, 1.5, label, 'HorizontalAlignment', 'right' );
    end
end

