function dispWeight( w, label, m, n )
% displays MNIST (or similar) weights
% W:     vector of weights of dim nvis, should be in the range of -3..3 
% label: number or string to be displayed, use [] if nothing to display
% m, n:  dimensions of image, can be omitted for matrices and for vectors of
%        square images (as with MNIST)
% label, m, n are optional
%
% examples:
% dispWeights( W(:,5) );
%                                                      Alfred Schöttl 2013
    if nargin <= 2 || nargin >= 3 && m==0 && n==0
        if size(w,1)>1 && size(w,2)>1
            m = size(w,1);
            n = size(w,2);
            w = reshape( w, 1, m*n );
        else
            m = floor( sqrt(length(w)) );
            n = m;
            w = reshape( w, 1, m*n );
        end
    end
    if nargin == 1
        label = [];
    end
    avg = mean(w); sd  = std(w);
    w = max(min((w-avg)/sd,2),-2);
    colormap( 'gray' );
    image( reshape( 32+w*16, m, n ) );
    axis equal
    set(gca,'Visible','off')
    if ~isempty(label)
        if ~ischar(label)
            label = num2str(label);
        end
        text( n-0.5, 1.5, label, 'HorizontalAlignment', 'right' );
    end
end

