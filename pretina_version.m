function [vstr, vinfo] = pretina_version()
	vinfo = struct( ...
		'url',      'https://github.com/oakyoon/pretina', ...
		'major',    0.9, ...
		'minor',    0, ...
		'revision', 'b' ...
		);
	vstr = sprintf('%.1f.%d%s', vinfo.major, vinfo.minor, vinfo.revision);
end