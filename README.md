# Shape_and_Gestures_iOS_App
<br>
In this very simple app, I have tried to demonstrate how to use different kind of gestures on an UIImageView.
Of course it can be extended to any other custom UIView as well.
<br>
#### Gestures experimented:
<br>
1. Tap
2. Double Tap
3. Triple Tap
4. Long Press
5. Pan
6. Rotate
7. Pinch
<br>
To try out these gesture in a simulator, you would simply do as the gesture name suggests.
<br>
For the Pan, click and move up/down/left/right.
<br>
The rotate and pinch gesture are kind of tricky. You would have to hold down the "option" key
and you will see two small circles pop to show your interaction. For pinch you can just move it
however you like to see zooming work. For rotate, you have to make sure that when you are moving
it the distance between the two circles remain the same for the effect to kick in.
<br>
#### Screenshots of the Shapes:
<br>
Circles
[!alt][circles]
[circles]: https://github.com/moon05/Shape_and_Gestures_iOS_App/screenshots/raw/circles_oneTap.png
Squares
[!alt][squares]
[squares]: https://github.com/moon05/Shape_and_Gestures_iOS_App/screenshots/squares_doubleTap.png
Triangles
[!alt][triangles]
[triangles]: https://github.com/moon05/Shape_and_Gestures_iOS_App/screenshots/triangles_tripleTap.png
A Custom Shape
[!alt][funkyShape]
[funkyShape]: https://github.com/moon05/Shape_and_Gestures_iOS_App/screenshots/funkyShape_rotate.png
Everything Together
[!alt][everything]
[everything]: https://github.com/moon05/Shape_and_Gestures_iOS_App/screenshots/allGestures.png
<br>
As you can see from the screenshots, the circles and squares are created at the same point. Same thing
goes for the triangles too, all at the same point. This is because, while trying to make a double or
triple tap, it still get registered as a single tap and double tap respectively. Hence, all three shapes
pop up. For it to recongnize the taps precisely, you would have to write a custom gesture recognizer
function with delay in it. This is also the reason, I haven't included the _Swipe_ gesture since it doesn't
work with the Pan gesture (or at least at the time of writing this) the way I have implemented it.
<br>
Also if you need to understand how **UIBezierPath** works, the shape drawing functions would be a good starting
point. And then there's always the official documentation.
<br>
