abstract class UseCaseWithParams<Type, Params> {
  Future<Type> call(Params params);

 const UseCaseWithParams();
}

abstract class UseCaseWithoutParams<Type> {
  Future<Type> call();

 const UseCaseWithoutParams();
}