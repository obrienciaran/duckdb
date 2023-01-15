## Overview 🧿
Here you will find code which combines Polars with DuckDB.

PyPolars is a fast multi-threaded DataFrame library/in-memory query engine. It is a library useful for doing exploratory data analysis with 
a faster execution time than Pandas. The API is very similar to that of Pandas so using Polars should not be a problem for analysts. You can check out 
Pandas vs Polars in some performance testing [here](https://kevinheavey.github.io/modern-polars/performance.html). Due to its speed, Polars is an obvious pairing for DuckDB. 

*Notes from the developers of Polars are below.*
---
## Performance 🚀🚀

### Blazingly fast

Polars is very fast. In fact, it is one of the best performing solutions available.
See the results in [h2oai's db-benchmark](https://h2oai.github.io/db-benchmark/).

In the [TPCH benchmarks](https://www.pola.rs/benchmarks.html) polars is orders of magnitudes faster than pandas, dask, modin and vaex
on full queries (including IO).

### Lightweight

Polars is also very lightweight. It comes with zero required dependencies, and this shows in the import times:

- polars: 70ms
- numpy: 104ms
- pandas: 520ms

### Handles larger than RAM data

If you have data that does not fit into memory, polars lazy is able to process your query (or parts of your query) in a
streaming fashion, this drastically reduces memory requirements so you might be able to process your 250GB dataset on your
laptop. Collect with `collect(streaming=True)` to run the query streaming. (This might be a little slower, but
it is still very fast!)
