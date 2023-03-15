
import 'package:cloud_firestore/cloud_firestore.dart';
import 'modelFirebase/modelMovies.dart';


   CollectionReference<MyMoviesList> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection('MoviesList')
        .withConverter<MyMoviesList>(
          fromFirestore: (snapshot, options) =>
              MyMoviesList.fromJson(snapshot.data()!),
          toFirestore: (movie, options) => movie.toJson(),
        );
  }

   Future<void> AddMovieToFirestore(MyMoviesList moviesList) {
    var collection = getMoviesCollection();
    var docRef = collection.doc();
    moviesList.id=docRef.id;
    print("${moviesList.idFilm}");
    return docRef.set(moviesList);
  }

  //  Stream<QuerySnapshot<MyMoviesList>> getMovieFromFirestore(int i) {
  //   return getMoviesCollection().orderBy(i).snapshots();
  // }
  //
  //  Future<void> deleteTaskFromFirestore(MyMoviesList movie) {
  //   return getMoviesCollection().doc('id').delete();
  // }

