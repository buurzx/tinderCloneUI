import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttery_dart2/layout.dart';
import './photos.dart';

class DraggableCard extends StatefulWidget {
  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with TickerProviderStateMixin {
  Offset cardOffset = const Offset(0.0, 0.0);
  Offset dragStart;
  Offset dragPosition;
  Offset slideBackStart;
  AnimationController slideBackAnimation;
  Tween<Offset> slideOutTween;
  AnimationController slideOutAnimation;

  @override
  void initState() {
    super.initState();
    slideBackAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addListener(() => setState(() {
            cardOffset = Offset.lerp(slideBackStart, const Offset(0.0, 0.0),
                Curves.elasticOut.transform(slideBackAnimation.value));
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            slideBackStart = null;
            dragPosition = null;
          });
        }
      });

    slideOutAnimation = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
      ..addListener(() => setState(() {
          cardOffset = slideOutTween.evaluate(slideOutAnimation);
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStart = null;
            dragPosition = null;
            slideOutTween = null;
            cardOffset = const Offset(0.0, 0.0);
          });
        }
      });
  }

  @override
  void dispose() {
    slideBackAnimation.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    dragStart = details.globalPosition;

    if (slideBackAnimation.isAnimating) {
      slideBackAnimation.stop(canceled: true);
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = details.globalPosition;
      cardOffset = dragPosition - dragStart;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final dragVector = cardOffset / cardOffset.distance;
    final isInNopeRegion = (cardOffset.dx / context.size.width) < -0.45;
    final isInLikeRegion = (cardOffset.dx / context.size.width) > 0.45;
    final isInSuperLikeRegion = (cardOffset.dy / context.size.height) < -0.40;
    final testDrag = dragVector * (2 * context.size.width);

    print('dragVector: $dragVector');
    // print('isInNopeRegion: $isInNopeRegion');
    // print('isInLikeRegion: $isInLikeRegion');
    // print('isInSuperLikeRegion: $isInSuperLikeRegion');
    print('testDrag: $testDrag');

    setState(() {
      if (isInNopeRegion || isInLikeRegion) {
        print('isInNopeRegion--------------------isInLikeRegion');
        slideOutTween = new Tween(
            begin: cardOffset, end: dragVector * (2 * context.size.width));

        slideOutAnimation.forward(from: 0.0);
      } else if (isInSuperLikeRegion) {
        slideOutTween = new Tween(
            begin: cardOffset, end: dragVector * (2 * context.size.height));
        slideOutAnimation.forward(from: 0.0);
      } else {
        slideBackStart = cardOffset;
        slideBackAnimation.forward(from: 0.0);
      }
    });

    slideBackStart = cardOffset;
    slideBackAnimation.forward(from: 0.0);
  }

  double _rotation(Rect dragBounds) {
    if (dragStart != null) {
      final rotationCornerMultiplier =
          dragStart.dy >= dragBounds.top + (dragBounds.height / 2) ? -1 : 1;
      return (pi / 8) *
          (cardOffset.dx / dragBounds.width) *
          rotationCornerMultiplier;
    } else {
      return 0.0;
    }
  }

  Offset _rotationOrigin(Rect dragBounds) {
    if (dragStart != null) {
      return dragStart - dragBounds.topLeft;
    } else {
      return const Offset(0.0, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new AnchoredOverlay(
      showOverlay: true,
      child: new Center(),
      overlayBuilder: (BuildContext context, Rect anchorBounds, Offset anchor) {
        return CenterAbout(
          position: anchor,
          child: new Transform(
            transform:
                new Matrix4.translationValues(cardOffset.dx, cardOffset.dy, 0.0)
                  ..rotateZ(_rotation(anchorBounds)),
            origin: _rotationOrigin(anchorBounds),
            child: new Container(
              width: anchorBounds.width,
              height: anchorBounds.height,
              padding: const EdgeInsets.all(16.0),
              child: new GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: new ProfileCard(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Widget _buildBackground() {
    return new PhotoBrowser(
      photoAssetPaths: [
        'assets/photo_1.jpg',
        'assets/photo_2.jpg',
        'assets/photo_3.jpg',
        'assets/photo_4.jpg',
      ],
      visiblePhotoIndex: 0,
    );
  }

  Widget _buildProfileSynopsis() {
    return new Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: new Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ])),
        padding: const EdgeInsets.all(24.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text('First Last',
                      style:
                          new TextStyle(color: Colors.white, fontSize: 24.0)),
                  new Text('Some description',
                      style: new TextStyle(color: Colors.white, fontSize: 18.0))
                ],
              ),
            ),
            new Icon(
              Icons.info,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: [
            new BoxShadow(
              color: const Color(0x11000000),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            )
          ]),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: new Material(
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _buildBackground(),
              _buildProfileSynopsis(),
            ],
          ),
        ),
      ),
    );
  }
}
