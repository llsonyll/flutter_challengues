import 'package:flutter/cupertino.dart';

class Ingredient {
  const Ingredient(this.image, this.offset);
  final String image;
  final List<Offset> offset;

  bool compare(Ingredient ingrediente) => ingrediente.image == image;
}

final ingredients = [
  Ingredient('assets/pizza_challengue/chili.png', <Offset>[
    Offset(0.2, 0.2),
    Offset(0.6, 0.2),
    Offset(0.4, 0.25),
    Offset(0.7, 0.5),
    Offset(0.4, 0.65),
  ]),
  Ingredient('assets/pizza_challengue/garlic.png', <Offset>[
    Offset(0.2, 0.3),
    Offset(0.6, 0.25),
    Offset(0.3, 0.23),
    Offset(0.5, 0.3),
    Offset(0.4, 0.65),
  ]),
  Ingredient('assets/pizza_challengue/olive.png', <Offset>[
    Offset(0.25, 0.5),
    Offset(0.6, 0.2),
    Offset(0.4, 0.25),
    Offset(0.4, 0.4),
    Offset(0.2, 0.6),
  ]),
  Ingredient('assets/pizza_challengue/pea.png', <Offset>[
    Offset(0.2, 0.2),
    Offset(0.6, 0.4),
    Offset(0.4, 0.25),
    Offset(0.3, 0.2),
    Offset(0.4, 0.6),
  ]),
  Ingredient('assets/pizza_challengue/pickle.png', <Offset>[
    Offset(0.2, 0.2),
    Offset(0.6, 0.2),
    Offset(0.4, 0.25),
    Offset(0.5, 0.3),
    Offset(0.4, 0.65),
  ]),
  Ingredient('assets/pizza_challengue/potato.png', <Offset>[
    Offset(0.2, 0.2),
    Offset(0.6, 0.2),
    Offset(0.4, 0.25),
    Offset(0.6, 0.6),
    Offset(0.2, 0.5),
  ]),
  Ingredient('assets/pizza_challengue/onion.png', <Offset>[
    Offset(0.2, 0.2),
    Offset(0.6, 0.5),
    Offset(0.5, 0.25),
    Offset(0.3, 0.2),
    Offset(0.4, 0.65),
  ]),
];
