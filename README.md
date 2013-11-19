BipsMotion
==========

A simple experiment for animated trajectory drawing.  
The application reads the timed-position sequence from a file and draws the encoded trajects to the canvas.

![shot](https://photos-2.dropbox.com/t/0/AADp0xrR2qCm5h1knHSf4IEVYTAFmEHXtu4aXDzlwLr3Jw/12/14037801/png/1024x768/3/1384840800/0/2/bips-motion.png/vQwMD61Qdb9WVU_QfLdPoLznp1KLgRJp4TFy8lnAoHw)

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

- _identifier_ - A unique identifer of the object.
- _x coordinate_, _y coordinate_ - The new position of the object.
- _moment_ - The time value (in seconds).

Currently the timing is not perfectly sincronized with the input values.
Further improvments need to be done to the mapping of frames to time intervals.

Another interesting feature would be random path generation. Further details are described in the proposal [#1][p1].

[p1]: https://github.com/rizo/BipsMotion/issues/1
