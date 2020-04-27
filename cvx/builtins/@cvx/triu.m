function x = triu( x, k )

%   Disciplined convex/geometric programming information for TRIU:
%       TRIU imposes no convexity restrictions on its arguments.

%
% Check inputs
%

if nargin < 2, k = 0; end
s = x.size_;
if length( s ) > 2,
    cvx_throw( 'The first argument must be 2-D.' );
elseif ~isnumeric( k ) || length( k ) ~= 1,
    cvx_throw( 'The second argument must be an integer scalar.' );
end

%
% Zero out the elements outside of the desired triangle
%

b = x.basis_;
b( :, ~triu(ones(s),k) ) = 0;
x = cvx( s, b );

% Copyright 2005-2014 CVX Research, Inc.
% See the file LICENSE.txt for full copyright information.
% The command 'cvx_where' will show where this file is located.