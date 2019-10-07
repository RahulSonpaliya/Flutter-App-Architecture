abstract class SplashState{}

class SplashInitialState extends SplashState{
  @override
  String toString() {
    return 'SplashInitialState{}';
  }
}

class NavigateToHomeState extends SplashState{
  @override
  String toString() {
    return 'NavigateToHomeState{}';
  }
}

class NavigateToWalkThroughState extends SplashState{
  @override
  String toString() {
    return 'NavigateToWalkThroughState{}';
  }
}

