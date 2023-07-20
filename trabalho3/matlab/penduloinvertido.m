function [sys,x0,str,ts] = penduloinvertido(t,x,flag)
    switch flag
        case 0
            str = [] ;
            ts = [0 0] ;
            s = simsizes ;
            s.NumContStates = 6;
            s.NumDiscStates = 0 ;
            s.NumOutputs = 6 ;
            s.NumInputs = 2 ;
            s.DirFeedthrough = 0 ;
            s.NumSampleTimes = 1 ;
            sys = simsizes(s) ;
            x0 = [0 0 0 0 0 0] ;
        case 1
            sys = penduloinvertido_f(t,x) ;
        case 3
            sys = x;
        case {2 4 9}
            sys =[];
        otherwise
            error(['unhandled flag =',num2str(flag)]) ;
    end
end