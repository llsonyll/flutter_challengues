import 'package:flutter/material.dart';

import 'ingredient.dart';

const mainColor = Colors.orange;
const secondColor = Colors.white;

const _pizzaCartSize = 48.0;

class PizzaOrder extends StatelessWidget {
  const PizzaOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: Text('Cusco Pizza Order'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 50,
              left: 10,
              right: 10,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PizzaDetails(),
                    ),
                    Expanded(
                      flex: 2,
                      child: _PizzaIngredients(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              height: _pizzaCartSize,
              width: _pizzaCartSize,
              left: MediaQuery.of(context).size.width / 2 - _pizzaCartSize / 2,
              child: _PizzaCartButton(
                ontap: () {
                  print("orden realizada");
                },
              ),
            ),
          ],
        ));
  }
}

class PizzaDetails extends StatefulWidget {
  const PizzaDetails({Key key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails>
    with SingleTickerProviderStateMixin {
  final _listIngredients = <Ingredient>[];
  double price = 15.0;
  final _notifierFocus = ValueNotifier(false);
  AnimationController _animationController;
  List<Animation> animationList = <Animation>[];
  BoxConstraints _pizzaConstraints;

  Widget _buildIngredientsWidget() {
    List<Widget> elements = [];
    if (animationList.isNotEmpty) {
      for (int i = 0; i < _listIngredients.length; i++) {
        Ingredient ingrediente = _listIngredients[i];
        final ingredientWidget = Image.asset(ingrediente.image, height: 40);
        for (int j = 0; j < ingrediente.offset.length; j++) {
          final animation = animationList[j];
          final position = ingrediente.offset[j];
          final positionX = position.dx;
          final positionY = position.dy;

          if (i == _listIngredients.length - 1) {
            double fromX = 0, fromY = 0;
            if (j < 1) {
              fromX = -_pizzaConstraints.maxWidth * (1 - animation.value);
            } else if (j < 2) {
              fromX = _pizzaConstraints.maxWidth * (1 - animation.value);
            } else if (j < 4) {
              fromY = -_pizzaConstraints.maxHeight * (1 - animation.value);
            } else {
              fromY = _pizzaConstraints.maxHeight * (1 - animation.value);
            }
            if (animation.value > 0) {
              elements.add(
                Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      fromX + _pizzaConstraints.maxWidth * positionX,
                      fromY + _pizzaConstraints.maxHeight * positionY,
                    ),
                  child: ingredientWidget,
                ),
              );
            }
          } else {
            elements.add(
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    _pizzaConstraints.maxWidth * positionX,
                    _pizzaConstraints.maxHeight * positionY,
                  ),
                child: ingredientWidget,
              ),
            );
          }
        }
      }
      return Stack(
        children: elements,
      );
    } else {
      return SizedBox.fromSize();
    }
  }

  void _buildIngredientAnimation() {
    animationList.clear();
    animationList.add(
      CurvedAnimation(
          curve: Interval(0.0, 0.8, curve: Curves.decelerate),
          parent: _animationController),
    );
    animationList.add(
      CurvedAnimation(
          curve: Interval(0.2, 0.8, curve: Curves.decelerate),
          parent: _animationController),
    );
    animationList.add(
      CurvedAnimation(
          curve: Interval(0.4, 1.0, curve: Curves.decelerate),
          parent: _animationController),
    );
    animationList.add(
      CurvedAnimation(
          curve: Interval(0.6, 0.7, curve: Curves.decelerate),
          parent: _animationController),
    );
    animationList.add(
      CurvedAnimation(
          curve: Interval(0.3, 1.0, curve: Curves.decelerate),
          parent: _animationController),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: DragTarget<Ingredient>(
                onAccept: (ingredient) {
                  print('onAccept');
                  _notifierFocus.value = false;
                  setState(() {
                    _listIngredients.add(ingredient);
                    price++;
                  });
                  _buildIngredientAnimation();
                  _animationController.forward(from: 0.0);
                },
                onWillAccept: (ingredient) {
                  print('onWillAccept');
                  _notifierFocus.value = true;
                  for (Ingredient ingrediente in _listIngredients) {
                    if (ingrediente.compare(ingredient)) {
                      return false;
                    }
                  }
                  return true;
                },
                onLeave: (ingredient) {
                  print('onLeave');
                  _notifierFocus.value = false;
                },
                builder: (context, candidateData, rejectedData) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      _pizzaConstraints = constraints;
                      return Center(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _notifierFocus,
                          builder: (context, value, _) {
                            return AnimatedContainer(
                              height: value
                                  ? constraints.maxHeight
                                  : constraints.maxHeight - 40,
                              duration: const Duration(milliseconds: 400),
                              child: Stack(
                                children: [
                                  Image.asset(
                                      'assets/pizza_challengue/dish.png'),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                        'assets/pizza_challengue/pizza-1.png'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 5.0),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: Offset(0.0, 0.0),
                        end: Offset(0.0, animation.value),
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: Text(
                '\$${price.toStringAsFixed(2)}',
                key: UniqueKey(),
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return _buildIngredientsWidget();
            }),
      ],
    );
  }
}

class _PizzaCartButton extends StatefulWidget {
  const _PizzaCartButton({Key key, this.ontap}) : super(key: key);
  final VoidCallback ontap;

  @override
  __PizzaCartButtonState createState() => __PizzaCartButtonState();
}

class __PizzaCartButtonState extends State<_PizzaCartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      lowerBound: 1.0,
      upperBound: 1.5,
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _animateButton() async {
    await _animationController.forward(from: 0.0);
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap();
        _animateButton();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: (2 - _animationController.value),
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.withOpacity(0.5),
                Colors.orange,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15.0,
                offset: Offset(0.0, 4.0),
                spreadRadius: 4.0,
              ),
            ],
          ),
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.brown,
            size: 32,
          ),
        ),
      ),
    );
  }
}

class _PizzaIngredients extends StatelessWidget {
  const _PizzaIngredients({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = ingredients[index];
        return PizzaIngredientItem(
          ingrediente: ingredient,
        );
      },
    );
  }
}

class PizzaIngredientItem extends StatelessWidget {
  const PizzaIngredientItem({Key key, this.ingrediente}) : super(key: key);

  final Ingredient ingrediente;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 45,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF5EED3),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image.asset(
          ingrediente.image,
          fit: BoxFit.contain,
        ),
      ),
    );
    return Center(
      child: Draggable(
        data: ingrediente,
        feedback: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.black26,
                offset: Offset(
                  0.0,
                  5.0,
                ),
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: child,
        ),
        child: child,
      ),
    );
  }
}
