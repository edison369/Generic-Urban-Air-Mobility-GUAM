function [y, y_x, y_u] = Fx_body(x,u,w,aero_coefs_pp,ders)
%
% Fb = Rx(gam)'*Fl
%
% Fx_b = Fx_l
%
% Inputs: 
%
%     x: Nx6 array of dynamic state
%        x = [ u v w p q r ] 
%
%     u: Nx4 array of inputs
%        u = [ T To del_f i ]
%
%     w: Nx8 array of strip parameters 
%        w = [ bx by bz A Ao S rho gam]
%   
%     aero_coefs_pp: aerodynamic polynomial fit coefficients
%
% Outputs:
%
%     y: Nx1 value of functional
%  
%     y_x: Nx6 array of derivative with respect to the state
%          y_x = [ dydu dydv dydw dydp dydq dydr ]
%
%     y_u: Nx4 array of derivative with respect to the input
%          y_x = [ dydT dydT0 dyddel_f dydi ]
%
%
%                    Y
%                     \
%                      \
%                        __
%                       \  \     _ _
%                        \**\ ___\/ \
%                X --- X*#####*+^^\_\
%                        o/\  \
%                           \__\
%                         |
%                         |
%                         Z
%
% state vector x:
%   u - velocity in body X-axis, m/s (ft/s)
%   v - velocity in body Y-axis, m/s (ft/s)
%   w - velocity in body Z-axis, m/s (ft/s)
%   p - angular velocity about body X-axis, rad/s 
%   q - angular velocity about body Y-axis, rad/s
%   r - angular velocity about body Z-axis, rad/s
%
% input vector u:
%     T - thrust of the non-overlapped propeller, N (lbf)
%    To - thrust of the overlapped propeller, N (lbf)
% del_f - delfection angle of the flap, rad
%     i - tilt angle of the wing, rad
%
% exogenous input vector w:
%  bx - strip c/4 x location with respect to center of mass, m (ft)
%  by - strip c/4 y location with respect to center of mass, m (ft)
%  bz - strip c/4 z location with respect to center of mass, m (ft)
%   A - non-overlapped propeller strip area, m^2 (ft^2)
%  Ao - overlapped propeller strip area, m^2 (ft^2)
%   S - wing strip area, m^2 (ft^2)
% rho - air density, kg/m^3 (slugs/ft^3)
% gam - wing dihedral angle  


gam = w(:,8);

% local flow conditions 
[uL uL_x uL_u] = u_local(x,u,w,ders);
[vL vL_x vL_u] = v_local(x,u,w,ders);
[wL wL_x wL_u] = w_local(x,u,w,ders);

% propeller induced velocity
[wi wi_x wi_u] = w_induced(x,u,w,ders,uL,uL_x,uL_u);

% wing angle of attack 
[alfs alfs_x alfs_u] = alf_slipstream(x,u,w,ders,...
                                      uL,uL_x,uL_u,...
                                      wL,wL_x,wL_u,...
                                      wi,wi_x,wi_u);

% slipstream angle of attack including flap deflection contribution
[alff alff_x alff_u] = alf_flaps(x,u,w,ders,alfs,alfs_x,alfs_u);

% local lift coefficient
[cl cl_x cl_u] = cl_local(x,u,w,aero_coefs_pp,ders,...
                          alff,alff_x,alff_u);

% local drag coefficient
[cd cd_x cd_u] = cd_local(x,u,w,aero_coefs_pp,ders,...
                          alff,alff_x,alff_u);

% local flow conditions 
[Vs Vs_x Vs_u] = V_slipstream(x,u,w,ders,...
                              uL,uL_x,uL_u,...
                              vL,vL_x,vL_u,...
                              wL,wL_x,wL_u,...
                              wi,wi_x,wi_u);

% slipstream dynamic pressure
[qs qs_x qs_u] = q_slipstream(x,u,w,ders,Vs,Vs_x,Vs_u);

% get the local Fx
[Fxl Fxl_x Fxl_u] = Fx_local(x,u,w,ders,...
                             cl,cl_x,cl_u,...
                             cd,cd_x,cd_u,...
                             alfs,alfs_x,alfs_u,...
                             qs,qs_x,qs_u);


% lift
Fx = Fxl;

% outputs
y = Fx;

if ders 

  %% take the derivates with respect to the states
  Fx_x1 = Fxl_x(:,1);
  Fx_x2 = Fxl_x(:,2);
  Fx_x3 = Fxl_x(:,3);
  Fx_x4 = Fxl_x(:,4);
  Fx_x5 = Fxl_x(:,5);
  Fx_x6 = Fxl_x(:,6);

  %% take the derivates with respect to the inputs
  Fx_u1 = Fxl_u(:,1);
  Fx_u2 = Fxl_u(:,2);
  Fx_u3 = Fxl_u(:,3);
  Fx_u4 = Fxl_u(:,4);


  % x = [ u      v      w      p      q      r ]
  y_x = [ Fx_x1  Fx_x2  Fx_x3  Fx_x4  Fx_x5  Fx_x6 ];

  % u = [ T      To     del    i ]
  y_u = [ Fx_u1  Fx_u2  Fx_u3  Fx_u4];

else 
  y_x = [];
  y_u = [];
end
