import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/tarefa.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.tarefa
  });

  final Tarefa tarefa;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MM/yyy - HH:mm').format(tarefa.date),
            style: TextStyle(
              fontSize: 12
            ),
          ),
          Text(
            tarefa.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

//TODO Implementar Slidable
