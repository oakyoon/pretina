function wrappedmat = wrap_angle(varargin)
%WRAP_ANGLE Wraps angles to be between -180 and 180 degrees.
%
%   WRAPPEDMAT = WRAP_ANGLE(ANGLES) returns a matrix with the same size as
%   ANGLES, whose elements are wrapped into the range between -180 and 180
%   degrees from the given ANGLES.
%
%   Arguments:
%      ANGLES - matrix containing angles in the monitor coordinate.
%
%   See also XY2ANGLE.

	angles = parse_arg(varargin, 1, mfilename, 'angles', [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan'});
	wrappedmat = mod(angles + 180, 360) - 180;
end