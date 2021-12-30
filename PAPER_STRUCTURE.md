# Technical Paper Structure: 

## Title: High-Performance Machine-Learning for FinTec

## Structure

1. Introduction:
   motivation, long term vision
2. Context and Challenges for ML in FinTec:
   trading strategies; portfolio rebalancing; metrics: profitability, robustness; other instruments
3. A High-performance Platform: invesdwin:
   - Overview structure with discussion of main components
   - ML techniques used: GA; specifics about strategy selection and mutation
   - Expression language: general summary, not full spec
   - Data streams: linkage to several streams and different kinds of instruments
4. Techniques for performance improvements:
   identify the **main contributors* to perf improvements and discuss details in turn:
   - bitset representation (expression language)
   - caching of data (expression language)
   - memoisation of evaluated expressions  (expression language)
   - NoSQL Database (data streams): ATimeSeriesDB = LevelDB (noSQL) + in-memory (software) caching
   - Inter-process communication via sockets (data steams): zero copy, zero allocation; 
   - (*something on GA techniques*)
   - *potential for parallelism*
   - *discuss memory footprint and limitations early*
5. Performance results:
   - try to measure the **main contributors** to performance improvements in turn
   - **end-to-end** performance comparisons with other systems: BuildAlpha; not so much JForex, MetaTrader
6. Conclusions:
   - focus on concrete numbers of performance improvements over other systems
   - identify the main contributor(s)
   

