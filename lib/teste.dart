import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



final content = StreamBuilder(
	stream: Firestore.instance.collection('listas').snapshots(),  
	builder: (BuildContext context, AsyncSnapshot snapshot){
	 if(!snapshot.hasData) return const Text('Carregando');
	 //para caso de erro
	return ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (BuildContext context, int index){
          
          DocumentSnapshot doc = snapshot.data.documents(index);
          return ListTile(
            leading: Icon(Icons.panorama),
            title: doc['nome'], //nome dado la na colecao do firebase
            trailing: GestureDetector(
              onTap: (){

              },
              child: Icon(Icons.delete),

          ),

          );

        },
        


  )