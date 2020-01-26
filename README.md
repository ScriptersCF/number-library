# Number Library

A library intended to aid developers with common number-related functions.


## Example

```lua
print(Number.Round(math.pi, 3)) ---> 3.142
print(("%X"):format(Number.Truncate(0xABCD, -1, 16, true))) --> 0xABC0 (base 16, truncate)
print(Number.Format(1957, 1)) --> 1.9K (no rounding)
print(Number.Format(-1957, 2, true)) --> -1.96K (rounding)
print(Number.Commaify(19576)) --> 19,576
```
