import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  List<Object> _my_shopping_list = []

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _newItem = TextEditingController();

  String? _selectedProduct;
  final List<String> _categories = ['Sitting', 'Kitchen', 'Bathroom', 'Bedroom'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text('My Shopping List', style: TextStyle(fontSize: 25)),
      ),
      body: Column(children: [_topHomeSection(), _searchBar()]),
    );
  }

  // Widgets
  Widget _topHomeSection() {
    return Row(
      children: <Widget>[
        Expanded(child: Text('Products 15')),
        Expanded(child: Text('Sum: 785.45 Ksh')),
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
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Category',
              border: OutlineInputBorder(),
            ),
            value: _selectedProduct,
            items: _categories.map(
              (String item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            ).toList(),
            onChanged: (value) {
              setState(() {
                _selectedProduct = value;
              });
            },
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              _addProduct()
            }, 
            child: Text(
              'Add Item'
            )
          )
        ],
      ),
    );
  }

  // Add Products
  void _addProduct(){
    setState((){
      

      _my_shopping_list.add()
    })
  }
}
