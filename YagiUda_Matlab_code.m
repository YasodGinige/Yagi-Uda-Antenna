close all; clear all                        % close all plots and clear all workspace variables

% The operating frequency (of the desired EM wave) for the antenna 
%------------------------------------------------------------------
freq = 96.754e6;                            % (1) Set the Antenna's operating frequency 

% Setting of other parameters 
%-----------------------------
tube_diameter = 10e-3;                      % (2) The diameter of the tubes used in the antenna design 
c = physconst('lightspeed');                % (3) Speed of electro magnetic waves 
%lambda = c/freq;                            % (4) Wavelength of the desired EM wave


% Basic antenna settings
%------------------------
%d = dipoleFolded;                           % (5) Create a folded dipole
%d.Length = 0.46*lambda;                     % (6) Set the length of the folded dipole
%d.Width = cylinder2strip(tube_diameter/2);  % (7) Set the equivalent width of the dipole strips used for the antenna by
                                            %     calculating the equivalent width of a strip approximation for a 
                                            %     cylinder cross section of the tube
                                            
%d.Spacing = d.Length/60;                    % (8) Set the width of the folded dipole 

yagidesign = yagiUda;                       % (9) Create a Yagi-Uda (YU) design object
yagidesign.Exciter = d;                     % (10) Set the exciter of YU to be the folded dipole defined above

Numdirs = 4;                                % (11) Set the number of directors
dirLength = 0.44*lambda*ones(1,Numdirs);    % (12) Set the length of each director
dirSpacing = 0.31*lambda*ones(1,Numdirs);   % (13) Set the directers spacing
yagidesign.NumDirectors = Numdirs;          % (14) Set the number of directors of YU to be `Numdirs' defined above
yagidesign.DirectorLength = dirLength;      % (15) Set the length of directors of YU to be `dirLength' defined above
yagidesign.DirectorSpacing = dirSpacing;    % (16) Set the director spacing of YU to be `dirSpacing' defined above
 
%  
refLength = 0.475*lambda;                   % (17) Set the length of the reflector
refSpacing = 0.25*lambda;                   % (18) Set the reflector spacing
yagidesign.ReflectorLength = refLength;     % (19) Set the length of reflector of YU to be `refLength' defined above
yagidesign.ReflectorSpacing = refSpacing;   % (22) Set the reflector spacing with folded dipole of YU to be `refSpacing' defined above


show(yagidesign)                            % (20) Show the antenna in a Matlab figure
fig1 = figure;                              % (21) Create a new Matlab figure
pattern(yagidesign,freq);                   % (22) Plot the 3-D radiation pattern of the YU  


done_ = 1;

