within MicroGrid.Control.RefGenerators;

model mppt
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Real Ts = 0.1;
  parameter Real deltaVpvRefPanel = 0.5;
  Real pot;
  Real potActFiltered;
  discrete Real potact;
  discrete Real potprev;
  discrete Real prevu;
  discrete Real actu;
  discrete Real deltau;
  discrete Real deltap;
  discrete Real vref(start = 30);
equation
  pot = u * i;
  der(potActFiltered) = (pot - potActFiltered) * 100;
  y = pre(vref);
algorithm
  when sample(0, Ts) then
    potprev := potact;
    potact := potActFiltered;
    prevu := actu;
    actu := u;
    deltau := actu - prevu;
    deltap := potact - potprev;
    if abs(deltau) > 0.1 * deltaVpvRefPanel then
      if abs(deltap) > 0.2 then
        if deltap / deltau > 0 then
          vref := vref + deltaVpvRefPanel;
        end if;
        if deltap / deltau < 0 then
          vref := vref - deltaVpvRefPanel;
        end if;
      end if;
    end if;
  end when;
end mppt;
