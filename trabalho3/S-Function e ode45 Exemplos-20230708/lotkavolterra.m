function [sys,x0,str,ts] = lotkavolterra(t,x,u,flag,xi)

switch flag,

  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes(xi);

  case 1,
    sys=mdlDerivatives(t,x,u);

  case {2,9},
    sys=[];

  case 3,
    sys=mdlOutputs(t,x,u);

  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end

function [sys,x0,str,ts]=mdlInitializeSizes(xi)

sizes = simsizes;

sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1; 

sys = simsizes(sizes);

x0  = xi;

str = [];

ts  = [0 0];

function sys=mdlDerivatives(t,x,u)

sys =lotkavolterra_f(t,x,u);

function sys=mdlOutputs(t,x,u)

sys = x;
