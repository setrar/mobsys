# MobSys Lab 3: Open RAN Advanced


```
cli test throughput ue1 dl -- gateway --time 45
```
> Returns
```yaml
------------------------------------------------------------
Client connecting to 12.1.1.1, TCP port 5001 with pid 54 (1 flows)
Write buffer size: 131072 Byte
TOS set to 0x0 (Nagle on)
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  1] local 12.1.1.2%oaitun_ue0 port 59519 connected with 12.1.1.1 port 5001 (reverse) (sock=3) on 2023-12-06 14:36:04.890 (UTC)
[ ID] Interval        Transfer    Bandwidth       Reads=Dist
[ *1] 0.00-1.00 sec  2.28 MBytes  19.1 Mbits/sec  994=994:0:0:0:0:0:0:0
[ *1] 1.00-2.00 sec  4.11 MBytes  34.5 Mbits/sec  1575=1570:2:0:0:1:0:0:2
[ *1] 2.00-3.00 sec  6.42 MBytes  53.8 Mbits/sec  2627=2607:19:0:1:0:0:0:0
[ *1] 3.00-4.00 sec  7.01 MBytes  58.8 Mbits/sec  2900=2872:27:1:0:0:0:0:0
[ *1] 4.00-5.00 sec  6.96 MBytes  58.4 Mbits/sec  2982=2961:21:0:0:0:0:0:0
[ *1] 5.00-6.00 sec  6.85 MBytes  57.5 Mbits/sec  2797=2774:21:2:0:0:0:0:0
[ *1] 6.00-7.00 sec  6.87 MBytes  57.6 Mbits/sec  2949=2934:15:0:0:0:0:0:0
[ *1] 7.00-8.00 sec  6.80 MBytes  57.1 Mbits/sec  2734=2710:21:0:0:0:1:0:2
[ *1] 8.00-9.00 sec  6.86 MBytes  57.6 Mbits/sec  2774=2736:37:1:0:0:0:0:0
[ *1] 9.00-10.00 sec  6.90 MBytes  57.9 Mbits/sec  2974=2950:22:2:0:0:0:0:0
[ *1] 10.00-11.00 sec  6.89 MBytes  57.8 Mbits/sec  2934=2918:16:0:0:0:0:0:0
[ *1] 11.00-12.00 sec  6.86 MBytes  57.6 Mbits/sec  2754=2722:31:1:0:0:0:0:0
[ *1] 12.00-13.00 sec  6.74 MBytes  56.5 Mbits/sec  2816=2794:22:0:0:0:0:0:0
[ *1] 13.00-14.00 sec  6.70 MBytes  56.2 Mbits/sec  2739=2717:22:0:0:0:0:0:0
[ *1] 14.00-15.00 sec  6.91 MBytes  57.9 Mbits/sec  2869=2849:20:0:0:0:0:0:0
[ *1] 15.00-16.00 sec  6.83 MBytes  57.3 Mbits/sec  2690=2648:42:0:0:0:0:0:0
[ *1] 16.00-17.00 sec  6.84 MBytes  57.4 Mbits/sec  2820=2794:26:0:0:0:0:0:0
[ *1] 17.00-18.00 sec  6.93 MBytes  58.1 Mbits/sec  2803=2768:35:0:0:0:0:0:0
[ *1] 18.00-19.00 sec  6.95 MBytes  58.3 Mbits/sec  2811=2787:24:0:0:0:0:0:0
[ *1] 19.00-20.00 sec  6.85 MBytes  57.4 Mbits/sec  2780=2754:25:1:0:0:0:0:0
[ *1] 20.00-21.00 sec  6.84 MBytes  57.4 Mbits/sec  2885=2865:18:2:0:0:0:0:0
[ *1] 21.00-22.00 sec  6.95 MBytes  58.3 Mbits/sec  2744=2712:31:1:0:0:0:0:0
[ *1] 22.00-23.00 sec  6.92 MBytes  58.1 Mbits/sec  2770=2743:27:0:0:0:0:0:0
[ *1] 23.00-24.00 sec  6.99 MBytes  58.7 Mbits/sec  2812=2781:31:0:0:0:0:0:0
[ *1] 24.00-25.00 sec  6.92 MBytes  58.1 Mbits/sec  2862=2843:17:1:1:0:0:0:0
[ *1] 25.00-26.00 sec  6.88 MBytes  57.7 Mbits/sec  2865=2839:26:0:0:0:0:0:0
[ *1] 26.00-27.00 sec  6.92 MBytes  58.1 Mbits/sec  2814=2779:34:0:1:0:0:0:0
[ *1] 27.00-28.00 sec  6.93 MBytes  58.2 Mbits/sec  2892=2869:23:0:0:0:0:0:0
[ *1] 28.00-29.00 sec  6.92 MBytes  58.0 Mbits/sec  2810=2787:21:1:1:0:0:0:0
[ *1] 29.00-30.00 sec  6.89 MBytes  57.8 Mbits/sec  2811=2785:25:1:0:0:0:0:0
[ *1] 30.00-31.00 sec  6.55 MBytes  55.0 Mbits/sec  1082=1038:10:2:0:1:1:1:29
[ *1] 31.00-32.00 sec  6.38 MBytes  53.5 Mbits/sec  2689=2672:17:0:0:0:0:0:0
[ *1] 32.00-33.00 sec  6.41 MBytes  53.8 Mbits/sec  2646=2624:22:0:0:0:0:0:0
[ *1] 33.00-34.00 sec  6.45 MBytes  54.1 Mbits/sec  1980=1949:18:0:0:0:1:0:12
[ *1] 34.00-35.00 sec  6.48 MBytes  54.3 Mbits/sec  2607=2583:23:1:0:0:0:0:0
[ *1] 35.00-36.00 sec  6.44 MBytes  54.0 Mbits/sec  2623=2598:24:1:0:0:0:0:0
[ *1] 36.00-37.00 sec  6.43 MBytes  53.9 Mbits/sec  2663=2640:22:1:0:0:0:0:0
[ *1] 37.00-38.00 sec  6.33 MBytes  53.1 Mbits/sec  2355=2325:28:2:0:0:0:0:0
[ *1] 38.00-39.00 sec  6.45 MBytes  54.1 Mbits/sec  2545=2516:29:0:0:0:0:0:0
[ *1] 39.00-40.00 sec  6.72 MBytes  56.4 Mbits/sec  2626=2605:21:0:0:0:0:0:0
[ *1] 40.00-41.00 sec  6.87 MBytes  57.6 Mbits/sec  2740=2710:29:0:1:0:0:0:0
[ *1] 41.00-42.00 sec  6.84 MBytes  57.4 Mbits/sec  2632=2599:33:0:0:0:0:0:0
[ *1] 42.00-43.00 sec  6.79 MBytes  57.0 Mbits/sec  2717=2688:28:1:0:0:0:0:0
[ *1] 43.00-44.00 sec  6.98 MBytes  58.6 Mbits/sec  2829=2796:32:1:0:0:0:0:0
[ *1] 44.00-45.00 sec  6.94 MBytes  58.2 Mbits/sec  2936=2914:21:0:1:0:0:0:0
[ *1] 45.00-45.38 sec  2.59 MBytes  56.8 Mbits/sec  1045=1032:13:0:0:0:0:0:0
[ *1] 0.00-45.38 sec   300 MBytes  55.5 Mbits/sec  120302=119151:1071:23:6:2:3:1:45
```

####  3.2 CSV Extraction

Questions
1. Explain the meaning of each column in the CSV file based on the SQL query.
2. How many slots and frames are there in the CSV file?
3. Which UE (based on the RNTI) is the target of the throughput test?

####  3.3 Data Analysis Questions

1. Plot the value of MCS for the target UE for the duration of the throughput test and explain the changes.
2. Plot TBS and PRB per frame for the target UE for the duration of the throughput test and explain the changes.
3. Calculate the average MAC throughput per second and compare it with the Iperf throughput report.
4. Calculate and plot the average PRB utilization per second for the target UE.

## 4 MCS Measurement

#### 4.1 Testing

Questions
1. Explain how the MCS value affects the TCP throughput.
2. Plot the TCP throughput for each MCS value using a bar chart.



