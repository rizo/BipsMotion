BipsMotion
==========

A simple experiment for animated trajectory drawing.
The application reads the timed-position map from a file or a stream and draws the trajects of the _agents_.

The input is described in JSON:

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

The elements in the arrays corespond to: _identifier_, _x coordinate_, _y coordinate_ and the _moment_ (in seconds).
