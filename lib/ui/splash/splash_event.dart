abstract class SplashEvent {}

class SplashInitialEvent extends SplashEvent{
  @override
  String toString() {
    return 'SplashInitialEvent{}';
  }
}

class NavigateToHomeEvent extends SplashEvent{
  @override
  String toString() {
    return 'NavigateToHomeEvent{}';
  }
}

class NavigateToWalkThroughEvent extends SplashEvent{
  @override
  String toString() {
    return 'NavigateToWalkThroughEvent{}';
  }
}

