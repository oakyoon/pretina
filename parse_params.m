function varargout = parse_params(params, varargin)
%PARSE_PARAMS Fills empty elements in a parameter vector.
%
%  Used in POSTFUNC_* and PREFUNC_* functions, intended for internal use only.

	n_params = size(params, 2);
	for i = 1:length(varargin)
		if n_params >= i
			varargout{i} = params(i);
		else
			varargout{i} = varargin{i};
		end
	end
end