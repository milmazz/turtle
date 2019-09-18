# Turtle

**TODO: Add description**

## TODO

### Turtle Motion

#### Move & Draw

* [x] `forward/1` (alias: `fd/1`) - Move the turtle forward by the specified distance.
* [x] `backward/1` (aliases: `bk/1`, `back/1`) - Move the turtle backward by given distance.
* [x] `right/1` (alias: `rt/1`) - Turn turtle right by _angle_ units (_degress_ by default).
* [x] `left/1` (alias: `lt/1`) - Turn turtle left by _angle_ units (_degress_ by default).
* [x] `go_to/1` - Move turtle to an absolute position.
* [x] `go_to/2` - Move turtle to an absolute position.
* [x] `set_x` - Set the turtle's x coordinate.
* [x] `set_y` - Set the turtle's y coordinate.
* [x] `set_heading` - Set the turtle's orientation to _angle_.
* [x] `home` - Move turtle to origin coordinates (0, 0) and set its heading to its start orientation.
* [ ] `circle` - Draw a circle with given radius.
* [ ] `dot` - Draw a circular dot with diameter size, using color.
* [x] `undo/0` - Undo the last turtle action(s).
* [ ] `speed` - Set the turtle's speed to an integer value in the range `0..10`, also allow to use _atoms_ like:
  - `:fastest`
  - `:fast`
  - `:normal`
  - `:slow`
  - `:slowest`

#### Turtle's state

* [x] `position/0` - Return the turtle's current location
* [x] `towards/1` - Return the angle between the line from turtle position to position specified by (x, y)
* [x] `towards/2`
* [x] `x_cor/0` - Return the turtle’s x coordinate.
* [x] `y_cor/0` - Return the turtle’s y coordinate.
* [x] `heading/0` - Return the turtle’s current heading
* [x] `distance/1` and `distance/2` - Return the distance from the turtle to (x, y)

#### Setting and measurement

* [ ] `degress` - Set angle measurement units, i.e. set number of “degrees” for
  a full circle. Default value is 360 degrees.
* [ ] `radians` - Set the angle measurement units to radians. Equivalent to `degrees(2*math.pi)`.

### Pen control

#### Drawing state

* [x] `pen_down/0` - Pull the pen down - drawing when moving.
* [x] `pen_up/0` - Pull the pen up - no drawing when moving.
* [x] `pen_size/0` - Return the line thickness.
* [x] `pen_size/1` - Set the line thickness.
* [x] `pen_down?/0` - Return `true` if pen is down, `false` if it's up.

#### Color control

* [x] `pen_color/0` - Return the pen color
* [x] `pen_color/1` - Set the pen color
* [ ] `fill_color/0` - Return the fill color
* [ ] `fill_color/1` - Set the fill color

#### Filling

* [ ] `fill/0` - Return `fill` state (`true` if filling).
* [ ] `fill/1` - Call `fill(true)` before drawing the shape you want to fill, and `fill(false)` when done.
* [ ] `begin_fill/0` - same as `fill(true)`
* [ ] `end_fill/0` - same as `fill(false)`

#### More drawing control

* [x] `reset` - delete the turtle's drawings from screen, re-center the turtle
      and set the variables to the default values
* [x] `clear` - delete the turtle’s drawings from the screen. Do not move
      turtle. State and position of the turtle as well as drawings of other
      turtles are not affected.

### Other improvements

* [ ] Add support `mode` (standard, logo)?
* [ ] Update arrow at the end of each movement
* [ ] Move functionality from `Home` scene into it own `turtle` Scenic Component?
* [ ] Support more than one Turtle, allow to set a cluster of turtles and share the state among them :)
* [ ] Improve README
* [ ] Improve examples. See this [issue](https://github.com/sunjay/turtle/issues/25) as a reference
* [ ] Add more doctest, more unit tests, property testing?
* [ ] Add a CHANGELOG https://keepachangelog.com/en/1.0.0/

## References

* https://docs.python.org/2/library/turtle.html#turtle.write
* https://github.com/sunjay/turtle
* https://cs.brown.edu/courses/bridge/1997/Resources/LogoTutorial.html
* http://www.logointerpreter.com/logo-reference/
* https://github.com/boydm/scenic
* https://en.m.wikipedia.org/wiki/Flood_fill
* https://github.com/buckle2000/turtle-playback/
