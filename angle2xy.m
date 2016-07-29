function [xmat, ymat] = angle2xy(varargin)
%ANGLE2XY Generates maps of x- and y-values from angles and their lengths.
%
%   [XMAT, YMAT] = ANGLE2XY(ANGLES [,LENGTHS]) returns matrices with the same
%   size as ANGLES and LENGTHS, whose elements contain x- and y-values of the
%   monitor coordinate for the given ANGLES and their LENGTHS.
%
%   Arguments:
%      ANGLES  - matrix containing angles in the monitor coordinate.
%      LENGTHS - matrix containing lengths for corresponding ANGLES, 1 if empty
%      or not provided.
%
%   See also XY2ANGLE.

	angles  = parse_arg(varargin, 1, mfilename, 'angles',  [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan'});
	lengths = parse_arg(varargin, 2, mfilename, 'lengths', 1,  {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan'});
	if ~isscalar(lengths)
		validateattributes(lengths, {'numeric'}, {'size', size(angles)}, mfilename, 'lengths', 2);
	end

	xmat = cosd(angles - 90) .* lengths;
	ymat = sind(angles - 90) .* lengths;
end