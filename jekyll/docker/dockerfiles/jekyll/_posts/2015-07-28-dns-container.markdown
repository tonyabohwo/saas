---
layout: post
title:  "DNS Container!"
date:   2015-07-27 10:04:22
categories: dns update
---
####INFO

https://www.madboa.com/geek/soho-bind/

####FORWARD ZONE

$TTL 1D
@ IN SOA dns1.synologyeth0.com. root.dns1.synologyeth0.com. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum
            IN NS   dns1.synologyeth0.com.
dns1        IN A    10.0.1.6
prodmini         IN A    10.0.1.254
romulus         IN A    10.0.1.101
thenightswatch         IN A    10.0.1.102
market         IN A    10.0.1.103
magnificent         IN A    10.0.1.23
centos67.ship1.prodmini         IN A    10.0.1.6
centos67.ship1.romulus          IN A    10.0.1.15
centos67.ship2.romulus          IN A    10.0.1.20
