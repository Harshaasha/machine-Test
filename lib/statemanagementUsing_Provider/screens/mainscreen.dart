
import 'package:aeth/statemanagementUsing_Provider/screens/whishlistscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

void main(){
  runApp(ChangeNotifierProvider<Providerclass>(
      create: (BuildContext context)=>Providerclass(),
      child  : MaterialApp(home: MovieMain(),debugShowCheckedModeBanner: false,)));
}
class MovieMain extends StatelessWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context) {

    var wishmovies = context.watch<Providerclass>().moviesWishList;
    var movies = context.watch<Providerclass>().movie;
    return Scaffold(
      appBar: AppBar(title: Text("Movies"),),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: ()=>Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=> WishListscreen())),
              icon: const Icon(Icons.favorite_border),
              label: Text("GoTo WishList ${wishmovies.length}")),
          Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context,index){

                    final currentMovie = movies[index];
                    return Card(
                      child: ListTile(
                        title: Text(currentMovie.title),
                        subtitle: Text(currentMovie.time!),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: wishmovies.contains(currentMovie)?Colors.red:Colors.black26,
                          ),
                          onPressed: (){
                            if(!wishmovies.contains(currentMovie)){
                              context
                                  .read<Providerclass>()
                                  .addtoWishList(currentMovie);
                            }else{
                              context
                                  .read<Providerclass>()
                                  .removeFromWishList(currentMovie);
                            }
                          }, ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
