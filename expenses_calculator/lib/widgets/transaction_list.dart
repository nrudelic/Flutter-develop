import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder( builder: (ctx, constraints){
          return Column(
              children: [
                Text('No transactions added yet!'),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.60,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );}
        )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title as String,
                  ),
                  subtitle: Text(DateFormat.yMMMd()
                      .format(transactions[index].date as DateTime)),
                  trailing: 
                  MediaQuery.of(context).size.width > 360 
                  ? FlatButton.icon(onPressed: () => deleteTransaction(transactions[index].id), icon: Icon(Icons.delete), label: Text('Delete')) 
                  : IconButton(onPressed: () => deleteTransaction(transactions[index].id), icon: Icon(Icons.delete),),
                  iconColor: Theme.of(context).errorColor,
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
