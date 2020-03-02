instvar.URL = 'https://github.com/ETMC-Exponenta/EV3-Tracker/archive/master.zip';
instvar.Name = 'EV3-Tracker';
% Main routine
fprintf('Downloading %s...\n', instvar.Name);
websave(instvar.Name, instvar.URL);
disp('Installing...')
disp('Download complete, unpacking...')
instvar.Fs = unzip(instvar.Name);
instvar.DName = instvar.Fs{1}(1:end-1);
movefile(instvar.DName, instvar.Name);
cd(instvar.Name)
disp('Unpucking complete, have fun!')
clear instvar
% Post-install tasks
open('EV3_Tracker.prj')