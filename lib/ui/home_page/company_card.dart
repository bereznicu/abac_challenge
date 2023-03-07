import 'package:abac_project/models/company_model.dart';
import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  final CompanyModel model;
  const CompanyCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          "name: ${model.name}\nprice: ${model.price}\nrating: ${model.rating}\ntime: ${model.time}",
        ),
      ),
    );
  }
}
