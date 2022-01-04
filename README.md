# Performance Notes

## HWL comments

**NB**: This repo is now linked with overleaf which should act as front end for developing the paper.

**HWL**: I've for now added my comments (below), tagged with this label, in the mark-down file

I think we should structure the discussion into 3 areas of performance improvement
- data input streams (**DATA**): covering connecting to external data stream and handling it locally
- compute engine (**ENGINE**): techniques for fast expression language evaluation
- ML framework (**ML**): efficient implementation of the GA implementation, strategy generation and mutation

We'll need to identify concrete technical issues that achieve the performance improvements. Just from
memory here are some that seem relevant (can you give pointers to data / discussion of these on your github page):
- bitset representation
- caching of data
- memoisation of evaluated expressions
- NoSQL Database (see below): [ATimeSeriesDB Summary](https://github.com/invesdwin/invesdwin-context-persistence#timeseries-module): ATimeSeriesDB = LevelDB (noSQL) + in-memory (software) caching
- Inter-process communication via sockets: zero copy, zero allocation; 

## Edwin Summary

*Brokers* (prbly **DATA**):
Contains Performance summaries I used for discussions with brokers and potential clients when I was searching for a pilot customer in 2020
Note that the latest database speed improvements now allow for ~3.8 million ticks instead of ~2 million ticks per second. 
Thus the measurements should mostly have at least doubled in speed since then and need to be repeated.

*DBA* (prbly combination of **ENGINE** and **ML**):
- GeneticCombination_loops contains benchmarks on the outer loops for GeneticProgramming (done in Q1 2021) (**ML**)
- Research_Proposal_Draft1 and Research_Proposal_draft_2 also contain feature comparisons against other platforms
  - Contains comparisons against BuildAlpha (https://www.buildalpha.com/). We can do Apples-To-Apples comparisons to that 
   since the expressions and generators are compatible to BuildAlpha (**ENGINE**)
- Master_Thesis_Q1_2013_Page_64_and_78 contains feature comparisons against other classical platforms 
  and did some initial estimations on performance of strategy generation (though these were beaten during the DBA by magnitudes)

### Online

--------------- Online -------------------

No SQL Database (**DATA**):
https://github.com/invesdwin/invesdwin-context-persistence#timeseries-module

IPC inter-process-communication (**DATA**):
https://github.com/invesdwin/invesdwin-context-integration#synchronous-channels

### Foreign language interfaces

**HWL**: I think foreign language integration is very useful but less of an issue for
a technical paper on high-performance ML. I'd suppose most measurements stay within the Java implementation.

#### Python Integration:
https://github.com/invesdwin/invesdwin-context-python#benchmark
https://github.com/invesdwin/invesdwin-trading-test/blob/master/invesdwin-trading-backtest-test/src/test/java/de/invesdwin/trading/backtest/strategy/python/PythonStrategyTest.java
- using python adds significant overhead

#### R Integration
- https://github.com/invesdwin/invesdwin-context-r/tree/master/invesdwin-context-r-parent/invesdwin-context-r-optimalf
- can be used to benchmark my implementation of DifferentialEvolution against another implementation inside R for OptimalF (both can be used from the platform for benchmarks)
  => though R version is significantly slower ...
  (**HWL** might be worth doing, comparing against an R-engine; I'd expect that to be slower)
  
### Invesdwin-Trading-Benchmarks:

#### InMemory-ML-Engine (**ENGINE** + **ML**)
- Language Definition Benchmarks (**ENGINE**): https://github.com/invesdwin/invesdwin-trading-test/tree/master/invesdwin-trading-backtest-test/src/test/java/de/invesdwin/trading/backtest/performance
- GeneticProgramming (**ML**): https://github.com/invesdwin/invesdwin-trading-test/blob/master/invesdwin-trading-backtest-test/src/test/java/de/invesdwin/trading/backtest/strategy/expression/DefaultExpressionStrategyTest.java

#### OtherEngines (JForex vs Metatrader vs Blackboard vs Historical)  (**ENGINE** + **ML**)
- https://github.com/invesdwin/invesdwin-trading-test/blob/master/invesdwin-trading-backtest-test/src/test/java/de/invesdwin/trading/backtest/strategy/run/TicksProcessingSpeedTest.java
- a raw ticks processing speed test, though the repo contains lots of strategies that can be used for benchmarks
- each strategy runs on all engines and integrations
- We could also use some of these tests to do some anaylsis with valgrind

#### JForex Integration
- https://github.com/invesdwin/invesdwin-trading-jforex
- can be used to do an Apples-to-Apples comparison against JForex (**HWL** would be  a useful reference point)

#### Metatrader Integration
- https://github.com/invesdwin/invesdwin-trading-metatrader
- can be used for tests against metatrader and overhead of calling metatrader in backtests (using http://www.nj4x.com/)
- though Metatrader is very slow

#### Comparisons to Zorro Platform and benchmarks for whites reality check and optimal F
- Contains Apples-To-Apples comparisons against Zorro Platform (https://www.zorro-trader.com/)
- Reimplemented the Workshop Strategies: https://manual.zorro-project.com/started.htm
- https://github.com/invesdwin/invesdwin-trading-test/tree/master/invesdwin-trading-backtest-test/src/test/java/de/invesdwin/trading/backtest/strategy/zorro


### Expression language optimisations

**HWL**: do you have a link to the main improvements of fast expression evaluation? I know it's in several of your reports.
