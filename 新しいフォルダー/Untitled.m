clear
close all

load Data

for ii = 2:4
    
    dat = DataMat(ii).B1.Force1(:,3) ;
    
    zero = mean(dat(1:1000)) ;
    fzz = dat - zero ;
    
    mm = 5000 ;
    fzz = fzz(mm:end) ;
    w = mean(fzz(1:1000)) ;
    tTO = find(fzz<w*0.03) ;
    
    fzz = fzz(tTO-1999:tTO+2000) ;
    
    eval(sprintf('fz%d = fzz', ii-1))
    plot(fzz)
    
end
clear fzz fz

save CMJ_Fz fz*



