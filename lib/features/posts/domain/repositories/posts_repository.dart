import '../entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class PostsRepository {
// repository abstract
//!
/*  لانه مشترك بين الدومين والدتا لير
layer 
abstract علشان يبقي حاجه واحده ومننكرراهاش 

نعمل implement  
ليها في 
data layer

////////
domain write fun 
data implement fun       بنفذها في الداتا لير
 */
//!
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
}
