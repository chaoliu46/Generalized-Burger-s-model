function Ju=Ju(Temperature,JuT,Ju0)
T0=1173;
% Ju=exp(-(k.*Temperature+Ju0))+m;
Ju=1./(JuT.*(Temperature-T0)+Ju0);
end