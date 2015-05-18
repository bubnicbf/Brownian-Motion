/*
plots Brownian motion displacement versus the expected behavior for an ensemble of cases
*/

function BrownianDisplacementDisplay ( k, n, m, d, t, dsq )

%
%  Get the T values.
%
  tvec = linspace ( 0, t, n );
%
%  Begin plotting.
%
  clf
  hold on
%
%  Select 5 random trajectories for display.
%
  for s = 1 : 5
    i = ceil ( k * rand ( 1, 1 ) );
    plot ( tvec, dsq(i,:), 'b-' )
  end
%
%  Display the average displacement.
%
  dsq_ave = sum ( dsq ) / k;
  plot ( tvec, dsq_ave, 'r-', 'LineWidth', 2 )
%
%  Display the ideal displacment.
%
  dsq_ideal = d * tvec;
  plot ( tvec, dsq_ideal, 'k-', 'LineWidth', 3 )

  grid on
  xlabel ( '<--T-->' )
  ylabel ( '<--D^2-->' )
  title ( 'Squared displacement (Red), Predicted (Black), Samples (Blue)' )
  hold off

  filename = sprintf ( 'displacement_%dd.png', m );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );


  return
end
