import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  final List<Shopping> _my_shopping_list = [
    Shopping(item: 'Rice', price: 52, category: Category.kitchen),
  ];

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Category _selectedProduct = Category.sitting;
  String _item = '';
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text('My Shopping List', style: TextStyle(fontSize: 25)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _topHomeSection(),
            _searchBar(),
            const SizedBox(height: 20),
            Divider(),
            Expanded(child: _shoppingList()),
          ],
        ),
      ),
    );
  }

  // Widgets
  Widget _topHomeSection() {
    final totalPrice = _my_shopping_list.fold<int>(
      0,
      (sum, item) => sum + item.price,
    );

    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'Products: ${_my_shopping_list.length}',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        Expanded(
          child: Text(
            'Sum: ${totalPrice} Ksh',
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter Item'),

            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a Product';
              }
              return null;
            },

            onSaved: (value) {
              _item = value!;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Enter Price'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Product Price';
              }
              final number = int.tryParse(value);
              if (number == null) {
                return 'invalid character';
              }
              return null;
            },
            onSaved: (value) {
              _price = int.tryParse(value ?? '0') ?? 0;
            },
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<Category>(
            decoration: const InputDecoration(
              labelText: 'Select Category',
              border: OutlineInputBorder(),
            ),
            value: _selectedProduct,
            items: Category.values
                .map(
                  (item) =>
                      DropdownMenuItem(value: item, child: Text(item.title)),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedProduct = value!;
              });
            },
          ),
          const SizedBox(height: 10),
          FilledButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();

                // add a shopping list
                setState(() {
                  _my_shopping_list.add(
                    Shopping(
                      item: _item,
                      price: _price,
                      category: _selectedProduct,
                    ),
                  );
                });
              }
            },
            child: Text('Add Item'),
          ),
        ],
      ),
    );
  }

  Widget _shoppingList() {
    return ListView.builder(
      itemCount: _my_shopping_list.length,
      itemBuilder: (_, index) {
        final item = _my_shopping_list[index];
        return Dismissible(
          key: Key(item.item + index.toString()), // Unique key
          direction: DismissDirection.endToStart, // swipe right to left
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            setState(() {
              _my_shopping_list.removeAt(index);
            });

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('${item.item} deleted')));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _my_shopping_list[index].category.color.withOpacity(0.5),
              ),
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _my_shopping_list[index].item,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_my_shopping_list[index].category.title),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _my_shopping_list[index].category.color,
                    ),
                    child: Text('${_my_shopping_list[index].price} Ksh'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
