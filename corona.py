#!/usr/bin/env python3

import sys
import requests
import math
import datetime

hitst_url = "https://covidapi.info/api/v1/country/" + sys.argv[1]
TTD = 7
inital_lethality = 0.016

#add  lethality in graph

h = requests.get(url=hitst_url)
dates = list(h.json()["result"].values())
days = list(h.json()["result"].keys())

for i in range(len(dates)):
    cases = dates[i]["confirmed"]
    deaths = dates[i]["deaths"]
    rec = dates[i]["recovered"]

    n = i + TTD
    if n < len(dates):
        fdeaths = dates[n]["deaths"]
        if deaths != 0:
            lethality = (fdeaths / cases)
            icases = cases / (inital_lethality / lethality)
            print(
                f"{days[i]}; {cases}; {icases}; {deaths}; {rec}; {lethality}")
        else:
            print(f"{days[i]}; {cases}; ; {deaths}; {rec}; ")
    else:
        print(f"{days[i]}; {cases}; ; {deaths}; {rec}; ")
