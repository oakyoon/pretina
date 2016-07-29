function anglemat = xy2angle(varargin)
%XY2ANGLE Generates a map of angles measured from the positive x-axis.
%
%   ANGLEMAT = XY2ANGLE(BX ,BY) returns a matrix with the same size as BX and
%   BY, whose elements contain angles measured from the positive x-axis in the
%   given monitor coordinates, BX and BY.
%
%   Arguments:
%      BX - matrix containing x-values of the monitor coordinate.
%      BY - matrix containing y-values of the monitor coordinate.
%
%   See also ANGLE2XY, WRAP_ANGLE, BASE_XY.

	bx = parse_arg(varargin, 1, mfilename, 'bx', [], {'numeric'}, {'real', 'finite', 'nonnan'});
	by = parse_arg(varargin, 2, mfilename, 'by', [], {'numeric'}, {'real', 'finite', 'nonnan', 'size', size(bx)});

	anglemat = mod(atan2(by, bx) / pi * 180 + 90, 360);
end