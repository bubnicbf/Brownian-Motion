/*
plots a Brownian motion trajectory for the case M = 2
*/
function BrownianMotionDisplay ( m, n, x )

  if ( m == 1 )
    y(1,1:n) = ( 0 : n - 1 ) / ( n - 1 );
    clf
    hold on
    plot ( x(1,:), y(1,:), 'Color', 'b', 'LineWidth', 2 )
    plot ( x(1,1), y(1,1), 'g.', 'MarkerSize', 35 );
    plot ( x(1,n), y(1,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Time-->' )
    title ( 'Brownian motion simulation in 1D' )
%   axis equal
    hold off
  elseif ( m == 2 )
    clf
    hold on
    plot ( x(1,:), x(2,:), 'Color', 'b', 'LineWidth', 2 )
    plot ( x(1,1), x(2,1), 'g.', 'MarkerSize', 35 );
    plot ( x(1,n), x(2,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Y-->' )
    title ( 'Brownian motion simulation in 2D' )
    axis equal
    hold off
  elseif ( m == 3 )
    clf
    hold on
    plot3 ( x(1,:), x(2,:), x(3,:), 'Color', 'b', 'LineWidth', 2 )
    plot3 ( x(1,1), x(2,1), x(3,1), 'g.', 'MarkerSize', 35 );
    plot3 ( x(1,n), x(2,n), x(3,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Y-->' )
    zlabel ( '<--Z-->' )
    title ( 'Brownian motion simulation in 3D' )
    axis equal
    view ( 3 )
    hold off
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BROWNIAN_MOTION_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  Cannot display data except for M = 1, 2, 3.\n' );
    return
  end

  filename = sprintf ( 'motion_%dd.png', m );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end
