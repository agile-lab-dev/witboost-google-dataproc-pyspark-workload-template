# ${{ values.name }}

This folder contains the Spark application source code.

It currently includes a small PySpark program that:

- Creates a `SparkSession`
- Reads an optional partitions argument from the command line
- Runs a Monte Carlo simulation to estimate pi in parallel using Spark
- Prints the estimated value
- Stops the Spark session

You can replace this sample logic with your real workload while keeping the same
entrypoint file name expected by the template.