BipsMotion
==========

A simple experiment for animated trajectory drawing.  
The application reads the timed-position sequence from a file and draws the encoded trajects to the canvas.

![shot](https://dl.dropboxusercontent.com/u/14037801/bips-motion.png)

The input data is described in JSON. Here is a sample file:

```javascript
[
 [0, 100, 100,  0],
 [0, 150, 150,  5],
 [0, 100, 200, 10],
 // ...
 
 [1, 300, 100,  0],
 [1, 350,  50,  5],
 // ...
 
 [2, 300, 500,  0],
 // ...
]
```

The array elements describe the frames where each value corespond to:

- `identifier` - A unique identifer of the object.
- `x coordinate`, `y coordinate` - The new position of the object.
- `moment` - The time value (in seconds).

You can get the compiled application from the [relese page](https://github.com/rizo/BipsMotion/releases/tag/v0.0.1).

Currently the timing is not perfectly sincronized with the input values.
Further improvments need to be done in the mapping of frames to time intervals.

Another interesting feature would be random path generation. Further details are described in the [proposal #1][p1].

[p1]: https://github.com/rizo/BipsMotion/issues/1
