# PhysicsJS Concepts and Introduction

* [Installation](http://wellcaffeinated.net/PhysicsJS/installation)
* [Basic Usage](http://wellcaffeinated.net/PhysicsJS/basic-usage)
* [Fundamentals](https://github.com/wellcaffeinated/PhysicsJS/wiki/Fundamentals)
* [Docs](http://wellcaffeinated.net/PhysicsJS/docs/)
* [Wiki](https://github.com/wellcaffeinated/PhysicsJS/wiki)

## The World

### The renderer
### The viewport

### Collisions

#### Elastic vs inelastic collisions

#### Detection - behaviors of the world

##### World edge collision detection
##### Body collision detection
##### Body impulse response
##### Collision events

#### Events

##### Emitting
##### Capturing

## The Bodies in the World

* Dynamic: integrated, collide, everything
* Kimematic: move at a specified velocity, other bodies collide with them, but they don't bounce off of other bodies
* Static: they stand still - obstacles

### Circles

### Rectangles

### Compound

### Point

### Convex Polygon

## Starting the simulation

## Making things move

### Velocity

#### Velocity to degrees

`Math.atan2(y, x) * 180/Math.PI`

#### Degrees to velocity

