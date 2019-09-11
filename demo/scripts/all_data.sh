#!/bin/bash

bash dordmem.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash dordcpu.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash dordip.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash dordpv.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash panosmem.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash panoscpu.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash panosip.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360
bash panospv.sh -t0=10-Sep-2017 -t1=20-Oct-2017 -i=360

# Coin cdr pricing rule
curl -X "POST" "http://localhost:4570/rule" -H "Content-Type: text/plain" -d $'import ch.icclab.cyclops.facts.Usage;
import ch.icclab.cyclops.facts.Charge;

rule "Static rule for cpu"
salience 50
when
  $usage: Usage(metric == "cpu")
then
  Charge charge = new Charge($usage);
  charge.setCharge(0.02 * $usage.getUsage());
  charge.setCurrency("CHF");

  retract($usage);
  insert(charge);
end'

# Coin cdr pricing rule
curl -X "POST" "http://localhost:4570/rule" -H "Content-Type: text/plain" -d $'import ch.icclab.cyclops.facts.Usage;
import ch.icclab.cyclops.facts.Charge;

rule "Static rule for storage"
salience 50
when
  $usage: Usage(metric == "storage")
then
  Charge charge = new Charge($usage);
  charge.setCharge(0.02 * $usage.getUsage());
  charge.setCurrency("CHF");

  retract($usage);
  insert(charge);
end'

# Coin cdr pricing rule
curl -X "POST" "http://localhost:4570/rule" -H "Content-Type: text/plain" -d $'import ch.icclab.cyclops.facts.Usage;
import ch.icclab.cyclops.facts.Charge;

rule "Static rule for ip"
salience 50
when
  $usage: Usage(metric == "ip")
then
  Charge charge = new Charge($usage);
  charge.setCharge(5 * $usage.getUsage());
  charge.setCurrency("CHF");

  retract($usage);
  insert(charge);
end'
